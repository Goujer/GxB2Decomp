using System.Runtime.InteropServices;
using UnityEngine;

public class LuaParticleEvent : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void GameObjectDelegate(GameObject go);

	private GameObjectDelegate mComplete;

	private bool didComplete;

	private bool mPause;

	private float mTimer;

	[SerializeField]
	private float mTotalTime;

	public GameObjectDelegate complete
	{
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

	private void OnDisable()
	{
	}

	public void Reset()
	{
	}

	public void Pause(bool value)
	{
	}
}
