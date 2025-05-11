using UnityEngine;

public class XYDApp : DontDestroyOnLoad
{
	public FPSCounter FPSCounter;

	private Vector2 _touchOrigin;

	public static bool NeedRestart { get; set; }

	public static bool ShowFps { get; set; }

	public static int FrameRate
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	private void Start()
	{
	}

	private void Update()
	{
	}

	private void OnApplicationQuit()
	{
	}

	private void StartApp()
	{
	}

	private void ToggleFPS()
	{
	}

	private void Reset()
	{
	}

	private void Run()
	{
	}

	private void RestartApp()
	{
	}

	private void StartLua()
	{
	}
}
