using LuaInterface;
using UnityEngine;

public class LuaLooper : MonoBehaviour
{
	public LuaState luaState;

	public LuaBeatEvent UpdateEvent { get; private set; }

	public LuaBeatEvent LateUpdateEvent { get; private set; }

	public LuaBeatEvent FixedUpdateEvent { get; private set; }

	private void Start()
	{
	}

	public void Run(LuaState lua)
	{
	}

	private LuaBeatEvent GetEvent(string name)
	{
		return null;
	}

	private void ThrowException()
	{
	}

	private void Update()
	{
	}

	private void LateUpdate()
	{
	}

	private void FixedUpdate()
	{
	}

	public void Destroy()
	{
	}

	private void OnDestroy()
	{
	}
}
