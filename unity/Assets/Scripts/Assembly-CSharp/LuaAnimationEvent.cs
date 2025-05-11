using System.Runtime.InteropServices;
using UnityEngine;

public class LuaAnimationEvent : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void StringDelegate(string name);

	private StringDelegate mCallback;

	public StringDelegate callback
	{
		set
		{
		}
	}

	public void AnimationEvent(string name)
	{
	}

	private void OnDestroy()
	{
	}
}
