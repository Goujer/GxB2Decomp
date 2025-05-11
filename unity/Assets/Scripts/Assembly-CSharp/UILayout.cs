using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class UILayout : UIWidgetContainer
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnReposition();

	[DoNotObfuscateNGUI]
	public enum Direction
	{
		HorizontalLayout = 0,
		VerticalLayout = 1,
		TileLayout = 2,
		HorizontalWaterFallLayout = 3
	}

	[DoNotObfuscateNGUI]
	public enum HorizontalAlign
	{
		Left = 0,
		Center = 1,
		Right = 2
	}

	[DoNotObfuscateNGUI]
	public enum VerticalAlign
	{
		Top = 0,
		Middle = 1,
		Bottom = 2
	}

	public int columns;

	public Vector2 cellSize;

	public Direction direction;

	public HorizontalAlign horizontalAlign;

	public VerticalAlign verticalAlign;

	public bool hideInactive;

	public bool keepWithinPanel;

	public Vector4 padding;

	public Vector2 gap;

	public OnReposition onReposition;

	protected UIPanel mPanel;

	protected bool mInitDone;

	protected bool mReposition;

	public bool repositionNow
	{
		set
		{
		}
	}

	public List<Transform> GetChildList()
	{
		return null;
	}

	protected virtual void Start()
	{
	}

	protected virtual void Init()
	{
	}

	protected virtual void LateUpdate()
	{
	}

	private void OnValidate()
	{
	}

	protected void RepositionVariableSize(List<Transform> children)
	{
	}

	private void RepositonTileLayout(List<Transform> children)
	{
	}

	private void RepositionHorizontalWaterFallLayout(List<Transform> children)
	{
	}

	private void RepositonHorizontalOrVertical(List<Transform> children)
	{
	}

	public virtual void Reposition()
	{
	}

	protected virtual void OnDestroy()
	{
	}
}
