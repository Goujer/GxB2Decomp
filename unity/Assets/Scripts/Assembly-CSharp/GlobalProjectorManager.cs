using System.Collections.Generic;
using UnityEngine;

public class GlobalProjectorManager : MonoBehaviour
{
	public enum ProjectionCulling
	{
		None = 0,
		ProjectorBounds = 1,
		ProjectionVolumeBounds = 2
	}

	private ProjectorEyeTexture _Tex;

	public Material _ProjectorMaterialShadow;

	private Matrix4x4 _ProjectorMatrix;

	private Matrix4x4 _ProjectorClipMatrix;

	private Matrix4x4 _BiasMatrix;

	private Matrix4x4 _ViewMatrix;

	private Matrix4x4 _BPV;

	private Matrix4x4 _BPVClip;

	private Matrix4x4 _ModelMatrix;

	private Matrix4x4 _FinalMatrix;

	private Matrix4x4 _FinalClipMatrix;

	private MaterialPropertyBlock _MBP;

	private int[] _ShadowResolutions;

	public static readonly string GlobalProjectorLayer;

	private static GlobalProjectorManager _Instance;

	private Vector3 _GlobalProjectionDir;

	private int _GlobalShadowResolution;

	private ProjectionCulling _GlobalShadowCullingMode;

	private float _GlobalCutOffDistance;

	private bool _renderShadows;

	private bool eyeTexCustomShader;

	private Camera _ProjectorCamera;

	private List<ShadowProjector> _ShadowProjectors;

	private List<ShadowReceiver> _ShadowReceivers;

	private Plane[] _mainCameraPlains;

	private bool _cameraPlainsCalculated;

	private Bounds _projectorBounds;

	public Shader _globalProjectorShader;

	public static Vector3 GlobalProjectionDir
	{
		get
		{
			return default(Vector3);
		}
		set
		{
		}
	}

	public static int GlobalShadowResolution
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public static ProjectionCulling GlobalShadowCullingMode
	{
		get
		{
			return default(ProjectionCulling);
		}
		set
		{
		}
	}

	public static float GlobalCutOffDistance
	{
		get
		{
			return 0f;
		}
		set
		{
		}
	}

	public bool ShadowsOn
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	public bool enableEyeTexSharder
	{
		get
		{
			return false;
		}
		set
		{
		}
	}

	private void changeCameraMaskLayer(bool isPlayer)
	{
	}

	public void setCameraEnable(bool isEnable)
	{
	}

	public static GlobalProjectorManager Get()
	{
		return null;
	}

	private void Initialize()
	{
	}

	private void Awake()
	{
	}

	private void Start()
	{
	}

	private void OnDestroy()
	{
	}

	public static void Reset()
	{
	}

	public static bool Exists()
	{
		return false;
	}

	public Texture GetShadowTexture()
	{
		return null;
	}

	public void AddProjector(ShadowProjector projector)
	{
	}

	public void RemoveProjector(ShadowProjector projector)
	{
	}

	public void AddReceiver(ShadowReceiver receiver)
	{
	}

	public void RemoveReceiver(ShadowReceiver receiver)
	{
	}

	private void OnProjectionDirChange()
	{
	}

	private void OnShadowResolutionChange()
	{
	}

	private void CreateProjectorEyeTexture()
	{
	}

	private void CalculateShadowBounds(Camera targetCamera, List<ShadowProjector> projectors)
	{
	}

	private void CalculateShadowBoundsSimple(Camera targetCamera)
	{
	}

	private void CheckMainCameraPlains()
	{
	}

	private bool IsProjectionVolumeVisible(Plane[] planes, ShadowProjector projector)
	{
		return false;
	}

	private void Update()
	{
	}

	private void LateUpdate()
	{
	}

	private void RenderProjectors(Camera targetCamera, List<ShadowProjector> projectors, Material material)
	{
	}

	private void Render(Material material)
	{
	}

	private void OnPreCull()
	{
	}

	private void OnPostRender()
	{
	}
}
