using System.Runtime.InteropServices;
using UnityEngine;

public class SpringPanel : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnFinished();

	public static SpringPanel current;

	public Vector3 target;

	public float strength;

	public bool isUpdateMoveBack;

	public OnFinished onFinished;

	private UIPanel mPanel;

	public Transform mTrans;

	private UIScrollView mDrag;

	private void Start()
	{
	}

	private void Update()
	{
	}

	protected virtual void AdvanceTowardsPosition()
	{
	}

	public static SpringPanel Begin(GameObject go, Vector3 pos, float strength)
	{
		return null;
	}

	public static SpringPanel Stop(GameObject go)
	{
		return null;
	}

	protected virtual void OnDestroy()
	{
	}
}
