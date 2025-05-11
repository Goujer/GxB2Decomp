using System.Runtime.InteropServices;
using UnityEngine;

public class ParticleController : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void CompleteDelegate();

	public ParticleSystem[] particles;

	public Animation[] animations;

	private CompleteDelegate LuaCallback;

	public void Pause()
	{
	}

	public void Play()
	{
	}

	public void Stop()
	{
	}

	public void Restart()
	{
	}

	public void OnParticleSystemStopped()
	{
	}

	public void addListener(string eventName, CompleteDelegate callback)
	{
	}
}
