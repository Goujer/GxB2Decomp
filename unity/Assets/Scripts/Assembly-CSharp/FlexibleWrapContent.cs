using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class FlexibleWrapContent : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnInitializeItem(GameObject go, int wrapIndex, int realIndex);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnScroll();

	public int itemSize;

	public bool cullContent;

	public int minIndex;

	public int maxIndex;

	public bool hideInactive;

	public OnInitializeItem onInitializeItem;

	public OnScroll onScroll;

	protected Transform mTrans;

	protected UIPanel mPanel;

	protected UIScrollView mScroll;

	protected bool mHorizontal;

	protected bool mFirstTime;

	protected List<Transform> mChildren;

	protected List<int> realIndexList;

	protected List<int> sortedIndex;

	private Vector2 mclipOffset;

	protected virtual void Start()
	{
	}

	protected virtual void OnMove(UIPanel panel)
	{
	}

	public virtual void SortBasedOnScrollMovement(bool update = true)
	{
	}

	public virtual void SortAlphabetically(bool update = true)
	{
	}

	protected bool CacheScrollView()
	{
		return false;
	}

	protected virtual void ResetRealIndexList()
	{
	}

	protected virtual void ResetChildPositions(bool update = true)
	{
	}

	public virtual void WrapContent()
	{
	}

	private void OnValidate()
	{
	}

	protected virtual void UpdateItem(Transform item, int index, int realIndex = 99999999)
	{
	}

	private void OnDestroy()
	{
	}
}
