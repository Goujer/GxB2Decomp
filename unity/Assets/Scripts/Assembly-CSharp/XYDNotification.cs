using System.Runtime.InteropServices;
using UnityEngine;

public class XYDNotification : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void NotifyCallback(bool paused);

	private static XYDNotification _instance;

	public NotifyCallback onAppPause;

	public static XYDNotification Instance
	{
		get
		{
			return null;
		}
	}

	private void Awake()
	{
	}

	public void Reset()
	{
	}

	public void Run()
	{
	}

	private void OnApplicationPause(bool paused)
	{
	}

	private void CleanNotification()
	{
	}
}
