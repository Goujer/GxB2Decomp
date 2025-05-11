using System.Runtime.InteropServices;
using UnityEngine;

public class UICenterOnChild : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnCenterCallback(GameObject centeredObject);

	public float springStrength;

	public float nextPageThreshold;

	public SpringPanel.OnFinished onFinished;

	public OnCenterCallback onCenter;

	private UIScrollView mScrollView;

	private GameObject mCenteredObject;

	public GameObject centeredObject
	{
		get
		{
			return null;
		}
	}

	private void Start()
	{
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void OnDragFinished()
	{
	}

	private void OnValidate()
	{
	}

	public void Recenter()
	{
	}

	private void CenterOn(Transform target, Vector3 panelCenter)
	{
	}

	public void CenterOn(Transform target)
	{
	}

	private void OnDestroy()
	{
	}
}
