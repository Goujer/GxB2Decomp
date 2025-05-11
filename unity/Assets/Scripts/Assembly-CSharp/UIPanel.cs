using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using DragonBones;
using UnityEngine;

[ExecuteInEditMode]
public class UIPanel : UIRect
{
	[DoNotObfuscateNGUI]
	public enum RenderQueue
	{
		Automatic = 0,
		StartAt = 1,
		Explicit = 2
	}

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnGeometryUpdated();

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnClippingMoved(UIPanel panel);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate Material OnCreateMaterial(UIWidget widget, Material mat);

	public static List<UIPanel> list;

	public OnGeometryUpdated onGeometryUpdated;

	public bool showInPanelTool;

	public bool generateNormals;

	public bool generateUV2;

	public UIDrawCall.ShadowMode shadowMode;

	public bool widgetsAreStatic;

	public bool cullWhileDragging;

	public bool alwaysOnScreen;

	public bool anchorOffset;

	public bool softBorderPadding;

	public RenderQueue renderQueue;

	public int startingRenderQueue;

	[NonSerialized]
	public List<UIWidget> widgets;

	[NonSerialized]
	public List<UIDrawCall> drawCalls;

	[NonSerialized]
	public Matrix4x4 worldToLocal;

	[NonSerialized]
	public Vector4 drawCallClipRange;

	public OnClippingMoved onClipMove;

	public OnCreateMaterial onCreateMaterial;

	public UIDrawCall.OnCreateDrawCall onCreateDrawCall;

	[HideInInspector]
	[SerializeField]
	private Texture2D mClipTexture;

	[HideInInspector]
	[SerializeField]
	private float mAlpha;

	[HideInInspector]
	[SerializeField]
	private UIDrawCall.Clipping mClipping;

	[HideInInspector]
	[SerializeField]
	private Vector4 mClipRange;

	[HideInInspector]
	[SerializeField]
	private Vector2 mClipSoftness;

	[HideInInspector]
	[SerializeField]
	private int mDepth;

	[HideInInspector]
	[SerializeField]
	private int mSortingOrder;

	[HideInInspector]
	[SerializeField]
	private string mSortingLayerName;

	private bool mRebuild;

	private bool mResized;

	[SerializeField]
	private Vector2 mClipOffset;

	private int mMatrixFrame;

	private int mAlphaFrameID;

	private int mLayer;

	private static float[] mTemp;

	private Vector2 mMin;

	private Vector2 mMax;

	private bool mSortWidgets;

	private bool mUpdateScroll;

	private Vector2 padding;

	[NonSerialized]
	private Vector2 minRect;

	[NonSerialized]
	private Vector2 maxRect;

	[NonSerialized]
	private Vector2 minArea;

	[NonSerialized]
	private Vector2 maxArea;

	[NonSerialized]
	private Vector4 finalClipRegionValue;

	public bool useSortingOrder;

	private UIPanel mParentPanel;

	private static Vector3[] mCorners;

	private static int mUpdateFrame;

	private static List<ParticleLayer> uiParticles;

	[NonSerialized]
	private static List<SpineAnim> renderQueueModifiers;

	private static List<UnityArmatureComponent> uiDragonBones;

	[NonSerialized]
	private bool mHasMoved;

	private UIDrawCall.OnRenderCallback mOnRender;

	private bool mForced;

	public string sortingLayerName
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public static int nextUnusedDepth
	{
		get
		{
			return 0;
		}
	}

	public override bool canBeAnchored
	{
		get
		{
			return false;
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

	public int sortingOrder
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public float width
	{
		get
		{
			return 0f;
		}
	}

	public float height
	{
		get
		{
			return 0f;
		}
	}

	public bool halfPixelOffset
	{
		get
		{
			return false;
		}
	}

	public bool usedForUI
	{
		get
		{
			return false;
		}
	}

	public Vector3 drawCallOffset
	{
		get
		{
			return default(Vector3);
		}
	}

	public UIDrawCall.Clipping clipping
	{
		get
		{
			return default(UIDrawCall.Clipping);
		}
		set
		{
		}
	}

	public UIPanel parentPanel
	{
		get
		{
			return null;
		}
	}

	public int clipCount
	{
		get
		{
			return 0;
		}
	}

	public bool hasClipping
	{
		get
		{
			return false;
		}
	}

	public bool hasCumulativeClipping
	{
		get
		{
			return false;
		}
	}

	[Obsolete]
	public bool clipsChildren
	{
		get
		{
			return false;
		}
	}

	public Vector2 clipOffset
	{
		get
		{
			return default(Vector2);
		}
		set
		{
		}
	}

	public Texture2D clipTexture
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
	public Vector4 clipRange
	{
		get
		{
			return default(Vector4);
		}
		set
		{
		}
	}

	public Vector4 baseClipRegion
	{
		get
		{
			return default(Vector4);
		}
		set
		{
		}
	}

	public Vector4 finalClipRegion
	{
		get
		{
			return default(Vector4);
		}
	}

	public Vector2 clipSoftness
	{
		get
		{
			return default(Vector2);
		}
		set
		{
		}
	}

	public override Vector3[] localCorners
	{
		get
		{
			return null;
		}
	}

	public override Vector3[] worldCorners
	{
		get
		{
			return null;
		}
	}

	public static int CompareFunc(UIPanel a, UIPanel b)
	{
		return 0;
	}

	private void InvalidateClipping()
	{
	}

	public override Vector3[] GetSides(UnityEngine.Transform relativeTo)
	{
		return null;
	}

	public override void Invalidate(bool includeChildren)
	{
	}

	public override float CalculateFinalAlpha(int frameID)
	{
		return 0f;
	}

	public override void SetRect(float x, float y, float width, float height)
	{
	}

	public bool IsVisible(Vector3 a, Vector3 b, Vector3 c, Vector3 d)
	{
		return false;
	}

	public bool IsVisible(Vector3 worldPos)
	{
		return false;
	}

	public bool IsVisible(UIWidget w)
	{
		return false;
	}

	public bool Affects(UIWidget w)
	{
		return false;
	}

	public void RebuildAllDrawCalls()
	{
	}

	public void SetDirty()
	{
	}

	protected override void Awake()
	{
	}

	private void FindParent()
	{
	}

	public override void ParentHasChanged()
	{
	}

	protected override void OnStart()
	{
	}

	protected override void OnEnable()
	{
	}

	protected override void OnInit()
	{
	}

	protected override void OnDisable()
	{
	}

	private void UpdateTransformMatrix()
	{
	}

	protected override void OnAnchor()
	{
	}

	private void LateUpdate()
	{
	}

	public static void AddUIParticle(ParticleLayer uiParticle)
	{
	}

	public static void RemoveUIParticle(ParticleLayer uiParticle)
	{
	}

	public static void UpdateUIParticles()
	{
	}

	public static void AddSpineAnim(SpineAnim uiDragonBone)
	{
	}

	public static void RemoveSpineAnim(SpineAnim uiDragonBone)
	{
	}

	public static void UpdateSpine()
	{
	}

	public static void AddUIDragonBones(UnityArmatureComponent uiDragonBone)
	{
	}

	public static void RemoveUIDragonBones(UnityArmatureComponent uiDragonBone)
	{
	}

	public static void UpdateUIDragonBones()
	{
	}

	private void UpdateSelf()
	{
	}

	public void SortWidgets()
	{
	}

	private void FillAllDrawCalls()
	{
	}

	public bool FillDrawCall(UIDrawCall dc)
	{
		return false;
	}

	private void UpdateDrawCalls(int sortOrder)
	{
	}

	private void UpdateLayers()
	{
	}

	private void UpdateWidgets()
	{
	}

	public UIDrawCall FindDrawCall(UIWidget w)
	{
		return null;
	}

	public void AddWidget(UIWidget w)
	{
	}

	public void RemoveWidget(UIWidget w)
	{
	}

	public void Refresh()
	{
	}

	public virtual Vector3 CalculateConstrainOffset(Vector2 min, Vector2 max)
	{
		return default(Vector3);
	}

	public Vector3 CalculateConstrainOffset2(Vector2 min, Vector2 max, float margine = 0f)
	{
		return default(Vector3);
	}

	public bool ConstrainTargetToBounds(UnityEngine.Transform target, ref Bounds targetBounds, bool immediate)
	{
		return false;
	}

	public bool ConstrainTargetToBounds(UnityEngine.Transform target, bool immediate)
	{
		return false;
	}

	public static UIPanel Find(UnityEngine.Transform trans)
	{
		return null;
	}

	public static UIPanel Find(UnityEngine.Transform trans, bool createIfMissing)
	{
		return null;
	}

	public static UIPanel Find(UnityEngine.Transform trans, bool createIfMissing, int layer)
	{
		return null;
	}

	public Vector2 GetWindowSize()
	{
		return default(Vector2);
	}

	public Vector2 GetViewSize()
	{
		return default(Vector2);
	}

	public void setPadding(float x, float y)
	{
	}
}
