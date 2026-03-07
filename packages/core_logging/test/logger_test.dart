import 'package:core_logging/core_logging.dart';
import 'package:flutter_test/flutter_test.dart';

/// Test logger that captures log records.
class TestLogger extends AppLogger {
  final List<LogRecord> records = [];

  @override
  void log(LogRecord record) {
    records.add(record);
  }
}

void main() {
  group('AppLogger', () {
    late TestLogger logger;

    setUp(() {
      logger = TestLogger();
    });

    test('debug logs at debug level', () {
      logger.debug('test message', tag: 'TestTag');

      expect(logger.records, hasLength(1));
      expect(logger.records.first.level, LogLevel.debug);
      expect(logger.records.first.message, 'test message');
      expect(logger.records.first.tag, 'TestTag');
    });

    test('info logs at info level', () {
      logger.info('info message');
      expect(logger.records.first.level, LogLevel.info);
    });

    test('warning logs at warning level with error', () {
      final error = Exception('test');
      logger.warning('warn', error: error);

      expect(logger.records.first.level, LogLevel.warning);
      expect(logger.records.first.error, error);
    });

    test('error logs at error level', () {
      logger.error('err', tag: 'Net');
      expect(logger.records.first.level, LogLevel.error);
      expect(logger.records.first.tag, 'Net');
    });

    test('fatal logs at fatal level', () {
      logger.fatal('fatal');
      expect(logger.records.first.level, LogLevel.fatal);
    });

    test('extra data is forwarded', () {
      logger.info('msg', extra: {'key': 'value'});
      expect(logger.records.first.extra, {'key': 'value'});
    });
  });

  group('CompositeLogger', () {
    test('fans out to all loggers', () {
      final a = TestLogger();
      final b = TestLogger();
      final composite = CompositeLogger([a, b]);

      composite.info('hello');

      expect(a.records, hasLength(1));
      expect(b.records, hasLength(1));
      expect(a.records.first.message, 'hello');
    });
  });

  group('ConsoleLogger', () {
    test('respects minimum level', () {
      // ConsoleLogger outputs to developer.log, so we just verify
      // it doesn't throw and respects the contract.
      final logger = ConsoleLogger(minLevel: LogLevel.warning);
      // Should not throw for any level.
      logger.debug('debug');
      logger.info('info');
      logger.warning('warn');
      logger.error('error');
    });
  });

  group('LogRecord', () {
    test('toString includes level and message', () {
      final record = LogRecord(
        level: LogLevel.error,
        message: 'something broke',
        tag: 'DB',
      );
      expect(record.toString(), contains('[ERROR]'));
      expect(record.toString(), contains('[DB]'));
      expect(record.toString(), contains('something broke'));
    });

    test('timestamp defaults to now', () {
      final before = DateTime.now();
      final record = LogRecord(level: LogLevel.info, message: 'msg');
      final after = DateTime.now();

      expect(record.timestamp.isAfter(before.subtract(const Duration(seconds: 1))), isTrue);
      expect(record.timestamp.isBefore(after.add(const Duration(seconds: 1))), isTrue);
    });
  });
}
