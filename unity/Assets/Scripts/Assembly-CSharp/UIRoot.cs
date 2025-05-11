using System.Collections.Generic;
using UnityEngine;

[ExecuteInEditMode]
public class UIRoot : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Scaling
	{
		Flexible = 0,
		Constrained = 1,
		ConstrainedOnMobiles = 2
	}

	[DoNotObfuscateNGUI]
	public enum Constraint
	{
		Fit = 0,
		Fill = 1,
		FitWidth = 2,
		FitHeight = 3
	}

	public static List<UIRoot> list;

	public Scaling scalingStyle;

	public int manualWidth;

	public int manualHeight;

	public int minimumHeight;

	public int maximumHeight;

	public bool fitWidth;

	public bool fitHeight;

	public bool adjustByDPI;

	public bool shrinkPortraitUI;

	public bool ignoreScaleResize;

	private Transform mTrans;

	public Constraint constraint
	{
		get
		{
			return default(Constraint);
		}
	}

	public Scaling activeScaling
	{
		get
		{
			return default(Scaling);
		}
	}

	public int activeHeight
	{
		get
		{
			return 0;
		}
	}

	public float pixelSizeAdjustment
	{
		get
		{
			return 0f;
		}
	}

	public static float GetPixelSizeAdjustment(GameObject go)
	{
		return 0f;
	}

	public float GetPixelSizeAdjustment(int height)
	{
		return 0f;
	}

	protected virtual void Awake()
	{
	}

	protected virtual void OnEnable()
	{
	}

	protected virtual void OnDisable()
	{
	}

	protected virtual void Start()
	{
	}

	private void Update()
	{
	}

	public void UpdateScale(bool updateAnchors = true)
	{
	}

	public static void Broadcast(string funcName)
	{
	}

	public static void Broadcast(string funcName, object param)
	{
	}
}
