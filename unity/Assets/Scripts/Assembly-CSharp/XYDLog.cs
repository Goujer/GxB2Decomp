using System;
using System.Diagnostics;
using System.IO;
using System.Runtime.InteropServices;
using UnityEngine;

public static class XYDLog
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void LogCallback(string condition, string stackTrace, XYDLogLevel logLevel);

	private static XYDLogLevel _logLevel;

	private static bool _isLogFile;

	private static StreamWriter _fileWriter;

	private static DateTime _startTime1970;

	private static long MAX_FILE_LENGTH;

	private static FileInfo _logFileInfo;

	private static string _logFullPath;

	private static bool _hasRegisterLogCallback;

	public static readonly bool IsUnityEditor;

	public static bool IsLogFile
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	private static event LogCallback _logCallbackEvent
	{
		add
		{
		}
		remove
		{
		}
	}

	public static event Action<string> LogErrorEvent
	{
		add
		{
		}
		remove
		{
		}
	}

	static XYDLog()
	{
	}

	public static void AddLogCallback(LogCallback callback)
	{
	}

	private static Application.LogCallback GetUnityLogCallback(LogCallback callback)
	{
		return null;
	}

	public static void RemoveLogCallback(LogCallback callback)
	{
	}

	public static int isShowLessLog()
	{
		return 0;
	}

	public static void LogFileCallbackHandler(string condition, string stacktrace, XYDLogLevel logLevel)
	{
	}

	private static void OnLogCallback(string condition, string stacktrace, XYDLogLevel logLevel)
	{
	}

	public static void LogConsole_MultiThread(string tag, string log, params object[] args)
	{
	}

	public static void Trace(string tag, string log, params object[] args)
	{
	}

	public static void Debug(string tag, string log, params object[] args)
	{
	}

	public static void Info(string tag, string log, params object[] args)
	{
	}

	public static void Logs(string tag, params object[] logs)
	{
	}

	public static void LogException(string tag, Exception e)
	{
	}

	public static void LogErrorWithStack(string tag, string err = "", int stack = 2)
	{
	}

	public static StackFrame GetTopStack(int stack = 2)
	{
		return null;
	}

	public static void Error(string tag, string err, params object[] args)
	{
	}

	public static void LogError(string tag, string err, params object[] args)
	{
	}

	public static void Warning(string tag, string err, params object[] args)
	{
	}

	public static void LogWarning(string tag, string err, params object[] args)
	{
	}

	private static void DoLog(string tag, string msg, object[] args, XYDLogLevel logLevel)
	{
	}

	public static void LogToFile(string msg)
	{
	}

	public static void LogToFile(string msg, bool append)
	{
	}

	public static void ClearOldLogs(string logPath)
	{
	}

	public static long GetLogFileTimestamp(string fullPath)
	{
		return 0L;
	}
}
