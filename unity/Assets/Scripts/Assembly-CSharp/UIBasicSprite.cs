using System;
using System.Collections.Generic;
using System.Diagnostics;
using UnityEngine;

public abstract class UIBasicSprite : UIWidget
{
	[DoNotObfuscateNGUI]
	public enum Type
	{
		Simple = 0,
		Sliced = 1,
		Tiled = 2,
		Filled = 3,
		Advanced = 4
	}

	[DoNotObfuscateNGUI]
	public enum FillDirection
	{
		Horizontal = 0,
		Vertical = 1,
		Radial90 = 2,
		Radial180 = 3,
		Radial360 = 4
	}

	[DoNotObfuscateNGUI]
	public enum AdvancedType
	{
		Invisible = 0,
		Sliced = 1,
		Tiled = 2
	}

	[DoNotObfuscateNGUI]
	public enum Flip
	{
		Nothing = 0,
		Horizontally = 1,
		Vertically = 2,
		Both = 3
	}

	[DoNotObfuscateNGUI]
	public enum OffsetType
	{
		Nothing = 0,
		Left = 1,
		Right = 2,
		Top = 3,
		Bottom = 4,
		Both = 5,
		Left_Right = 6,
		Top_Bottom = 7
	}

	[HideInInspector]
	[SerializeField]
	protected Type mType;

	[HideInInspector]
	[SerializeField]
	protected FillDirection mFillDirection;

	[HideInInspector]
	[SerializeField]
	protected float mFillAmount;

	[HideInInspector]
	[SerializeField]
	protected bool mInvert;

	[HideInInspector]
	[SerializeField]
	protected Flip mFlip;

	[HideInInspector]
	[SerializeField]
	protected bool mApplyGradient;

	[HideInInspector]
	[SerializeField]
	protected Color mGradientTop;

	[HideInInspector]
	[SerializeField]
	protected Color mGradientBottom;

	[HideInInspector]
	[SerializeField]
	protected OffsetType mOffsetType;

	[NonSerialized]
	private Rect mInnerUV;

	[NonSerialized]
	private Rect mOuterUV;

	public AdvancedType centerType;

	public AdvancedType leftType;

	public AdvancedType rightType;

	public AdvancedType bottomType;

	public AdvancedType topType;

	protected static Vector2[] mTempPos;

	protected static Vector2[] mTempUVs;

	public virtual Type type
	{
		get
		{
			return default(Type);
		}
		set
		{
		}
	}

	public Flip flip
	{
		get
		{
			return default(Flip);
		}
		set
		{
		}
	}

	public FillDirection fillDirection
	{
		get
		{
			return default(FillDirection);
		}
		set
		{
		}
	}

	public float fillAmount
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public override int minWidth
	{
		get
		{
			return 0;
		}
	}

	public override int minHeight
	{
		get
		{
			return 0;
		}
	}

	public bool invert
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool hasBorder
	{
		get
		{
			return false;
		}
	}

	public virtual bool premultipliedAlpha
	{
		get
		{
			return false;
		}
	}

	public virtual float pixelSize
	{
		get
		{
			return 0f;
		}
	}

	protected virtual Vector4 padding
	{
		get
		{
			return default(Vector4);
		}
	}

	private Vector4 drawingUVs
	{
		get
		{
			return default(Vector4);
		}
	}

	protected Color drawingColor
	{
		get
		{
			return default(Color);
		}
	}

	protected void Fill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols, Rect outer, Rect inner)
	{
	}

	private void SimpleFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	private void SlicedFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	[DebuggerHidden]
	[DebuggerStepThrough]
	private void AddVertexColours(List<Color> cols, ref Color color, int x, int y)
	{
	}

	private void TiledFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	private void FilledFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	private void AdvancedFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}

	private static bool RadialCut(Vector2[] xy, Vector2[] uv, float fill, bool invert, int corner)
	{
		return false;
	}

	private static void RadialCut(Vector2[] xy, float cos, float sin, bool invert, int corner)
	{
	}

	private static void Fill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols, float v0x, float v1x, float v0y, float v1y, float u0x, float u1x, float u0y, float u1y, Color col)
	{
	}
}
