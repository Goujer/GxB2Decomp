using System.Runtime.InteropServices;
using UnityEngine;

public class DogMainController : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void CompleteDelegate();

	private CompleteDelegate fixedUpdateCallFun;

	private CompleteDelegate updateCallFun;

	private CompleteDelegate lateUpdateCallFun;

	private UITexture lineTexture;

	private LineRenderer lineObj;

	private bool isCanDraw;

	private void Start()
	{
	}

	private void Update()
	{
	}

	private void FixedUpdate()
	{
	}

	public void AddFixedUpdateCallBack(CompleteDelegate callback)
	{
	}

	private void fixedUpdateCallBack()
	{
	}

	public void AddUpdateCallBack(CompleteDelegate callback)
	{
	}

	private void UpdateCallBack()
	{
	}

	private void LateUpdate()
	{
	}

	public void AddLineTexture(LineRenderer line, UITexture texture)
	{
	}

	private void ChangeOrder()
	{
	}
}
