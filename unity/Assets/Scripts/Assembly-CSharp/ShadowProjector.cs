using UnityEngine;

public class ShadowProjector : MonoBehaviour
{
	private static class MeshGen
	{
		public static Mesh CreatePlane(Vector3 up, Vector3 right, Rect uvRect, Color color)
		{
			return null;
		}
	}

	[SerializeField]
	protected Vector3 _GlobalProjectionDir;

	[SerializeField]
	protected int _GlobalShadowResolution;

	[SerializeField]
	protected GlobalProjectorManager.ProjectionCulling _GlobalShadowCullingMode;

	[SerializeField]
	private bool _EnableCutOff;

	[SerializeField]
	protected float _GlobalCutOffDistance;

	[SerializeField]
	private float _ShadowSize;

	[SerializeField]
	private Color _ShadowColor;

	[SerializeField]
	private float _ShadowOpacity;

	public Material _Material;

	[SerializeField]
	private bool _IsLight;

	[SerializeField]
	private Vector3 _ShadowLocalOffset;

	[SerializeField]
	private Quaternion _RotationAngleOffset;

	[SerializeField]
	private bool _FreezeXRot;

	[SerializeField]
	private bool _FreezeYRot;

	[SerializeField]
	private bool _FreezeZRot;

	[SerializeField]
	private Rect _UVRect;

	[SerializeField]
	private bool _AutoSizeOpacity;

	[SerializeField]
	private float _AutoSOCutOffDistance;

	[SerializeField]
	private float _AutoSORayOriginOffset;

	[SerializeField]
	private float _AutoSOMaxScaleMultiplier;

	[SerializeField]
	private int _AutoSORaycastLayer;

	private MeshRenderer _Renderer;

	private MeshFilter _MeshFilter;

	private Mesh _ShadowDummyMesh;

	private GameObject _ShadowDummy;

	private float _initialSize;

	private float _initialOpacity;

	public Vector3 GlobalProjectionDir
	{
		get
		{
			return default(Vector3);
		}
		set
		{
		}
	}

	public int GlobalShadowResolution
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public GlobalProjectorManager.ProjectionCulling GlobalShadowCullingMode
	{
		get
		{
			return default(GlobalProjectorManager.ProjectionCulling);
		}
		set
		{
		}
	}

	public bool EnableCutOff
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public float GlobalCutOffDistance
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public float ShadowSize
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public Color ShadowColor
	{
		get
		{
			return default(Color);
		}
		set
		{
		}
	}

	public float ShadowOpacity
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public bool IsLight
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public Vector3 ShadowLocalOffset
	{
		get
		{
			return default(Vector3);
		}
		set
		{
		}
	}

	public Quaternion RotationAngleOffset
	{
		get
		{
			return default(Quaternion);
		}
		set
		{
		}
	}

	public bool FreezeXRot
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool FreezeYRot
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool FreezeZRot
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public Rect UVRect
	{
		get
		{
			return default(Rect);
		}
		set
		{
		}
	}

	public bool AutoSizeOpacity
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public float AutoSOCutOffDistance
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public float AutoSORayOriginOffset
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public float AutoSOMaxScaleMultiplier
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public int AutoSORaycastLayer
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	private void Awake()
	{
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

	private void OnDestroy()
	{
	}

	public Bounds GetBounds()
	{
		return default(Bounds);
	}

	public bool IsVisible()
	{
		return false;
	}

	public void SetVisible(bool visible)
	{
	}

	public void SetRenderMaterial(Material mat)
	{
	}

	public void setGlobCustomShader(bool isEnable)
	{
	}

	private void Update()
	{
	}

	public void OnPreRenderShadowProjector(Camera camera)
	{
	}

	public Matrix4x4 ShadowDummyLocalToWorldMatrix()
	{
		return default(Matrix4x4);
	}

	public float GetShadowWorldSize()
	{
		return 0f;
	}

	public Vector3 GetShadowPos()
	{
		return default(Vector3);
	}

	private void OnShadowSizeChanged()
	{
	}

	private void OnUVRectChanged()
	{
	}

	public void OnShadowColorChanged()
	{
	}

	private void RebuildMesh()
	{
	}
}
