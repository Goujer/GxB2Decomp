using System;
using UnityEngine;

public class UIKeyNavigation : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Constraint
	{
		None = 0,
		Vertical = 1,
		Horizontal = 2,
		Explicit = 3
	}

	public static BetterList<UIKeyNavigation> list;

	public Constraint constraint;

	public GameObject onUp;

	public GameObject onDown;

	public GameObject onLeft;

	public GameObject onRight;

	public GameObject onClick;

	public GameObject onTab;

	public bool startsSelected;

	[NonSerialized]
	private bool mStarted;

	public static int mLastFrame;

	public static UIKeyNavigation current
	{
		get
		{
			return null;
		}
	}

	public bool isColliderEnabled
	{
		get
		{
			return false;
		}
	}

	protected virtual void OnEnable()
	{
	}

	private void Start()
	{
	}

	protected virtual void OnDisable()
	{
	}

	private static bool IsActive(GameObject go)
	{
		return false;
	}

	public GameObject GetLeft()
	{
		return null;
	}

	public GameObject GetRight()
	{
		return null;
	}

	public GameObject GetUp()
	{
		return null;
	}

	public GameObject GetDown()
	{
		return null;
	}

	public GameObject Get(Vector3 myDir, float x = 1f, float y = 1f)
	{
		return null;
	}

	protected static Vector3 GetCenter(GameObject go)
	{
		return default(Vector3);
	}

	public virtual void OnNavigate(KeyCode key)
	{
	}

	public virtual void OnKey(KeyCode key)
	{
	}

	protected virtual void OnClick()
	{
	}
}
