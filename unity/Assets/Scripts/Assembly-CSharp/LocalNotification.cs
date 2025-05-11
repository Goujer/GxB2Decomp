using UnityEngine;

public class LocalNotification
{
	public enum NotificationExecuteMode
	{
		Inexact = 0,
		Exact = 1,
		ExactAndAllowWhileIdle = 2
	}

	private static string fullClassName;

	public static void SendNotification(int id, int delay, string title, string message, string subText, Color color, string summaryJson, string frontendParams, string soundName, string bigIcon)
	{
	}

	public static void SendNotification(int id, long delay, string title, string message, string subText, Color32 bgColor, string summaryJson, string frontendParams, string soundName, bool sound = true, bool vibrate = true, bool lights = true, string bigIcon = "", NotificationExecuteMode executeMode = NotificationExecuteMode.Inexact)
	{
	}

	public static void SendRepeatingNotification(int id, long delay, long timeout, string title, string message, string subText, Color bgColor, string summaryJson, string frontendParams, string soundName, string bigIcon = "")
	{
	}

	public static void SendRepeatingNotification(int id, long delay, long timeout, string title, string message, string subText, Color32 bgColor, string summaryJson, string frontendParams, string soundName, bool sound = true, bool vibrate = true, bool lights = true, string bigIcon = "")
	{
	}

	public static void CancelNotification(int id)
	{
	}

	public static void CancelAllNotifications()
	{
	}
}
