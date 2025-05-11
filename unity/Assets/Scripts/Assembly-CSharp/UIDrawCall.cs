using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;
using UnityEngine.SceneManagement;

[ExecuteInEditMode]
public class UIDrawCall : MonoBehaviour
{
	[DoNotObfuscateNGUI]
	public enum Clipping
	{
		None = 0,
		TextureMask = 1,
		SoftClip = 3,
		ConstrainButDontClip = 4
	}

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnRenderCallback(Material mat);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void OnCreateDrawCall(UIDrawCall dc, MeshFilter filter, MeshRenderer ren);

	[DoNotObfuscateNGUI]
	public enum ShadowMode
	{
		None = 0,
		Receive = 1,
		CastAndReceive = 2
	}

	private static BetterList<UIDrawCall> mActiveList;

	private static BetterList<UIDrawCall> mInactiveList;

	[NonSerialized]
	[HideInInspector]
	public int widgetCount;

	[NonSerialized]
	[HideInInspector]
	public int depthStart;

	[NonSerialized]
	[HideInInspector]
	public int depthEnd;

	[NonSerialized]
	[HideInInspector]
	public UIPanel manager;

	[NonSerialized]
	[HideInInspector]
	public UIPanel panel;

	[NonSerialized]
	[HideInInspector]
	public Texture2D clipTexture;

	[NonSerialized]
	[HideInInspector]
	public bool alwaysOnScreen;

	[NonSerialized]
	[HideInInspector]
	public List<Vector3> verts;

	[NonSerialized]
	[HideInInspector]
	public List<Vector3> norms;

	[NonSerialized]
	[HideInInspector]
	public List<Vector4> tans;

	[NonSerialized]
	[HideInInspector]
	public List<Vector2> uvs;

	[NonSerialized]
	[HideInInspector]
	public List<Vector4> uv2;

	[NonSerialized]
	[HideInInspector]
	public List<Color> cols;

	[NonSerialized]
	private Material mMaterial;

	[NonSerialized]
	private Texture mTexture;

	[NonSerialized]
	private Shader mShader;

	[NonSerialized]
	private int mClipCount;

	[NonSerialized]
	private Transform mTrans;

	[NonSerialized]
	private Mesh mMesh;

	[NonSerialized]
	private MeshFilter mFilter;

	[NonSerialized]
	private MeshRenderer mRenderer;

	[NonSerialized]
	private Material mDynamicMat;

	[NonSerialized]
	private int[] mIndices;

	[NonSerialized]
	private ShadowMode mShadowMode;

	[NonSerialized]
	private bool mRebuildMat;

	[NonSerialized]
	private bool mLegacyShader;

	[NonSerialized]
	private int mRenderQueue;

	[NonSerialized]
	private int mTriangles;

	[NonSerialized]
	public bool isDirty;

	[NonSerialized]
	private bool mTextureClip;

	[NonSerialized]
	private bool mIsNew;

	public OnRenderCallback onRender;

	public OnCreateDrawCall onCreateDrawCall;

	[NonSerialized]
	private string mSortingLayerName;

	[NonSerialized]
	private int mSortingOrder;

	private static ColorSpace mColorSpace;

	private const int maxIndexBufferCache = 10;

	private static List<int[]> mCache;

	protected MaterialPropertyBlock mBlock;

	private static int[] ClipRange;

	private static int[] ClipArgs;

	private static int dx9BugWorkaround;

	public bool mSclip;

	public bool mSclear;

	[Obsolete]
	public static BetterList<UIDrawCall> list
	{
		get
		{
			return null;
		}
	}

	public static BetterList<UIDrawCall> activeList
	{
		get
		{
			return null;
		}
	}

	public static BetterList<UIDrawCall> inactiveList
	{
		get
		{
			return null;
		}
	}

	public int renderQueue
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

	public int finalRenderQueue
	{
		get
		{
			return 0;
		}
	}

	public Transform cachedTransform
	{
		get
		{
			return null;
		}
	}

	public Material baseMaterial
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public Material dynamicMaterial
	{
		get
		{
			return null;
		}
	}

	public Texture mainTexture
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public Shader shader
	{
		get
		{
			return null;
		}
		set
		{
		}
	}

	public ShadowMode shadowMode
	{
		get
		{
			return default(ShadowMode);
		}
		set
		{
		}
	}

	public int triangles
	{
		get
		{
			return 0;
		}
	}

	public bool isClipped
	{
		get
		{
			return false;
		}
	}

	private void CreateMaterial()
	{
	}

	private Material RebuildMaterial()
	{
		return null;
	}

	private void UpdateMaterials()
	{
	}

	public void UpdateGeometry(int widgetCount)
	{
	}

	private int[] GenerateCachedIndexBuffer(int vertexCount, int indexCount)
	{
		return null;
	}

	private void OnWillRenderObject()
	{
	}

	private void SetClipping(int index, Vector4 cr, Vector2 soft, float angle)
	{
	}

	private void Awake()
	{
	}

	private void OnEnable()
	{
	}

	private void OnDisable()
	{
	}

	private void OnDestroy()
	{
	}

	public static UIDrawCall Create(UIPanel panel, Material mat, Texture tex, Shader shader, bool stencilClip, bool stencilClear)
	{
		return null;
	}

	private static UIDrawCall Create(string name, UIPanel pan, Material mat, Texture tex, Shader shader, bool stencilClip, bool stencilClear)
	{
		return null;
	}

	private static UIDrawCall Create(string name)
	{
		return null;
	}

	public static void ClearAll()
	{
	}

	public static void ReleaseAll()
	{
	}

	public static void ReleaseInactive()
	{
	}

	public static int Count(UIPanel panel)
	{
		return 0;
	}

	public static void Destroy(UIDrawCall dc)
	{
	}

	public static void MoveToScene(Scene scene)
	{
	}
}
