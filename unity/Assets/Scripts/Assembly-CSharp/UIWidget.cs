using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Runtime.InteropServices;
using UnityEngine;

[ExecuteInEditMode]
public class UIWidget : UIRect
{
	[DoNotObfuscateNGUI]
	public enum Pivot
	{
		TopLeft = 0,
		Top = 1,
		TopRight = 2,
		Left = 3,
		Center = 4,
		Right = 5,
		BottomLeft = 6,
		Bottom = 7,
		BottomRight = 8
	}

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnDimensionsChanged();

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnDisPoseFunc();

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnPostFillCallback(UIWidget widget, int bufferOffset, List<Vector3> verts, List<Vector2> uvs, List<Color> cols);

	[DoNotObfuscateNGUI]
	public enum AspectRatioSource
	{
		Free = 0,
		BasedOnWidth = 1,
		BasedOnHeight = 2
	}

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate bool HitCheck(Vector3 worldPos);

	[HideInInspector]
	[SerializeField]
	protected Color mColor;

	[HideInInspector]
	[SerializeField]
	protected Pivot mPivot;

	[HideInInspector]
	[SerializeField]
	protected int mWidth;

	[HideInInspector]
	[SerializeField]
	protected int mHeight;

	[HideInInspector]
	[SerializeField]
	protected int mDepth;

	[HideInInspector]
	[SerializeField]
	public bool isflipVert;

	[HideInInspector]
	[SerializeField]
	protected bool isFlipVertDone;

	[HideInInspector]
	[SerializeField]
	public bool mStencilClip;

	[HideInInspector]
	[SerializeField]
	public bool mStencilClear;

	[HideInInspector]
	[SerializeField]
	protected Material mMat;

	public OnDimensionsChanged onChange;

	public OnDisPoseFunc onDispose;

	public OnPostFillCallback onPostFill;

	public UIDrawCall.OnRenderCallback mOnRender;

	public bool autoResizeBoxCollider;

	public bool hideIfOffScreen;

	public AspectRatioSource keepAspectRatio;

	public float aspectRatio;

	public bool Has_Invalidated;

	public HitCheck hitCheck;

	[NonSerialized]
	public UIPanel panel;

	[NonSerialized]
	public UIGeometry geometry;

	[NonSerialized]
	public bool fillGeometry;

	[NonSerialized]
	protected bool mPlayMode;

	[NonSerialized]
	protected Vector4 mDrawRegion;

	[NonSerialized]
	private Matrix4x4 mLocalToPanel;

	[NonSerialized]
	private bool mIsVisibleByAlpha;

	[NonSerialized]
	private bool mIsVisibleByPanel;

	[NonSerialized]
	private bool mIsInFront;

	[NonSerialized]
	private float mLastAlpha;

	[NonSerialized]
	private bool mMoved;

	[NonSerialized]
	public UIDrawCall drawCall;

	[NonSerialized]
	protected Vector3[] mCorners;

	[NonSerialized]
	private int mAlphaFrameID;

	private int mMatrixFrame;

	private Vector3 mOldV0;

	private Vector3 mOldV1;

	public UIDrawCall.OnRenderCallback onRender
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public Vector4 drawRegion
	{
		get
		{
			return default(Vector4);
		}
		set
		{
		}
	}

	public Vector2 pivotOffset
	{
		get
		{
			return default(Vector2);
		}
	}

	public int width
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public int height
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public Color color
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	public override float alpha
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public bool invalidated
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool isVisible
	{
		get
		{
			return false;
		}
	}

	public bool hasVertices
	{
		get
		{
			return false;
		}
	}

	public Pivot rawPivot
	{
		get
		{
			return default(Pivot);
		}
		set
		{
		}
	}

	public Pivot pivot
	{
		get
		{
			return default(Pivot);
		}
		set
		{
		}
	}

	public int depth
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public int raycastDepth
	{
		get
		{
			return 0;
		}
	}

	public override Vector3[] localCorners
	{
		get
		{
			return null;
		}
	}

	public virtual Vector2 localSize
	{
		get
		{
			return default(Vector2);
		}
	}

	public Vector3 localCenter
	{
		get
		{
			return default(Vector3);
		}
	}

	public override Vector3[] worldCorners
	{
		get
		{
			return null;
		}
	}

	public Vector3 worldCenter
	{
		get
		{
			return default(Vector3);
		}
	}

	public virtual Vector4 drawingDimensions
	{
		get
		{
			return default(Vector4);
		}
	}

	public virtual Material material
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public virtual Texture mainTexture
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public virtual Shader shader
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	[Obsolete]
	public Vector2 relativeSize
	{
		get
		{
			return default(Vector2);
		}
	}

	public bool hasBoxCollider
	{
		get
		{
			return false;
		}
	}

	public virtual int minWidth
	{
		get
		{
			return 0;
		}
	}

	public virtual int minHeight
	{
		get
		{
			return 0;
		}
	}

	public virtual Vector4 border
	{
		get
		{
			return default(Vector4);
		}
		set
		{
		}
	}

	public void SetColorNoAlpha(Color c)
	{
	}

	public void SetDimensions(int w, int h)
	{
	}

	public override Vector3[] GetSides(Transform relativeTo)
	{
		return null;
	}

	public override float CalculateFinalAlpha(int frameID)
	{
		return 0f;
	}

	protected void UpdateFinalAlpha(int frameID)
	{
	}

	public override void Invalidate(bool includeChildren)
	{
	}

	public float CalculateCumulativeAlpha(int frameID)
	{
		return 0f;
	}

	public override void SetRect(float x, float y, float width, float height)
	{
	}

	public void ResizeCollider()
	{
	}

	[DebuggerHidden]
	[DebuggerStepThrough]
	public static int FullCompareFunc(UIWidget left, UIWidget right)
	{
		return 0;
	}

	[DebuggerHidden]
	[DebuggerStepThrough]
	public static int PanelCompareFunc(UIWidget left, UIWidget right)
	{
		return 0;
	}

	public Bounds CalculateBounds()
	{
		return default(Bounds);
	}

	public Bounds CalculateBounds(Transform relativeParent)
	{
		return default(Bounds);
	}

	public void SetDirty()
	{
	}

	public void RemoveFromPanel()
	{
	}

	public virtual void MarkAsChanged()
	{
	}

	public UIPanel CreatePanel()
	{
		return null;
	}

	public void CheckLayer()
	{
	}

	public override void ParentHasChanged()
	{
	}

	protected override void Awake()
	{
	}

	protected override void OnInit()
	{
	}

	protected virtual void UpgradeFrom265()
	{
	}

	protected override void OnStart()
	{
	}

	protected override void OnAnchor()
	{
	}

	protected override void OnUpdate()
	{
	}

	private void OnApplicationPause(bool paused)
	{
	}

	protected override void OnDisable()
	{
	}

	private void OnDestroy()
	{
	}

	public bool UpdateVisibility(bool visibleByAlpha, bool visibleByPanel)
	{
		return false;
	}

	public bool UpdateTransform(int frame)
	{
		return false;
	}

	public bool UpdateGeometry(int frame)
	{
		return false;
	}

	public void WriteToBuffers(List<Vector3> v, List<Vector2> u, List<Color> c, List<Vector3> n, List<Vector4> t, List<Vector4> u2)
	{
	}

	public virtual void MakePixelPerfect()
	{
	}

	public virtual void OnFill(List<Vector3> verts, List<Vector2> uvs, List<Color> cols)
	{
	}
}
