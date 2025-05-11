using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class UIWrapContent : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnInitializeItem(GameObject go, int wrapIndex, int realIndex);

	public int itemSize;

	public bool cullContent;

	public int minIndex;

	public int maxIndex;

	public bool hideInactive;

	public OnInitializeItem onInitializeItem;

	protected Transform mTrans;

	protected UIPanel mPanel;

	protected UIScrollView mScroll;

	protected bool mHorizontal;

	protected bool mFirstTime;

	protected List<Transform> mChildren;

	protected Dictionary<int, Transform> indexDict;

	public bool startDo;

	protected virtual void Start()
	{
	}

	protected virtual void OnMove(UIPanel panel)
	{
	}

	public virtual void SortBasedOnScrollMovement()
	{
	}

	public virtual void SortAlphabetically()
	{
	}

	protected bool CacheScrollView()
	{
		return false;
	}

	protected virtual void ResetChildPositions()
	{
	}

	public void UpdateCurrentItems()
	{
	}

	public virtual void WrapContent()
	{
	}

	private void OnValidate()
	{
	}

	protected virtual void UpdateItem(Transform item, int index)
	{
	}

	protected virtual void OnDestroy()
	{
	}
}
