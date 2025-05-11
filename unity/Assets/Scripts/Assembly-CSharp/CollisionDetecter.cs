using LuaInterface;
using UnityEngine;

public class CollisionDetecter : MonoBehaviour
{
	public LuaFunction collisionEnterCall;

	public LuaFunction collisionStayCall;

	public LuaFunction collisionExitCall;

	public LuaFunction triggerEnterCall;

	public LuaFunction triggerStayCall;

	public LuaFunction triggerExitCall;

	private Collision2D collisionOther;

	private Collider2D colliderOther;

	private void Start()
	{
	}

	private void Update()
	{
	}

	private void OnCollisionEnter2D(Collision2D other)
	{
	}

	private void OnCollisionStay2D(Collision2D other)
	{
	}

	private void OnCollisionExit2D(Collision2D other)
	{
	}

	private void OnTriggerEnter2D(Collider2D other)
	{
	}

	private void OnTriggerStay2D(Collider2D other)
	{
	}

	private void OnTriggerExit2D(Collider2D other)
	{
	}

	public GameObject GetCollisionOther()
	{
		return null;
	}

	public GameObject GetColliderOther()
	{
		return null;
	}

	public Vector3 GetTriggerPoint()
	{
		return default(Vector3);
	}
}
