using System.Runtime.InteropServices;
using UnityEngine;

public class DogGameBox : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void CompleteDelegate(GameObject k, int houseIndex, int beeIndex);

	private CompleteDelegate collisionEnterCallFun;

	private CompleteDelegate collisionStayCallFun;

	private CompleteDelegate trigerEnterCallFun;

	private CompleteDelegate trigerStayCallFun;

	private CompleteDelegate trigerExitCallFun;

	private CompleteDelegate updateCallFun;

	private bool isCanDraw;

	public int beeIndex;

	public int houseIndex;

	private void Start()
	{
	}

	private void FixedUpdate()
	{
	}

	public void addUpdateCallBack(CompleteDelegate callback)
	{
	}

	private void OnCollisionEnter2D(Collision2D other)
	{
	}

	private void OnCollisionStay2D(Collision2D other)
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

	public void addCollisionEnterCallBack(CompleteDelegate callback)
	{
	}

	public void addCollisionStayCallBack(CompleteDelegate callback)
	{
	}

	public void addTrigerEnterCallBack(CompleteDelegate callback)
	{
	}

	public void addTrigerStayCallBack(CompleteDelegate callback)
	{
	}

	public void addTrigerExitCallBack(CompleteDelegate callback)
	{
	}
}
