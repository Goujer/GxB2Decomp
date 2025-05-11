using System.Runtime.InteropServices;
using UnityEngine;

public class SheetAnimMesh : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void AnimNotify(ESheetMeshAnim finishAnim);

	public const float TIMESTEP = 0.025f;

	public const float INVERSE_TIMESTEP = 40f;

	public float speed;

	private int keyframeCount;

	private int stepIndex;

	private float animLength;

	private float animTimer;

	private float fixedAnimTimer;

	private Mesh[] curAnimMesh;

	private MeshFilter meshShower;

	private ESheetMeshAnim curAnim;

	private ushort modelID;

	public ESAWrapMode playMode;

	public AnimNotify animNotify;

	public bool isPlaying;

	public bool pause;

	public void Init(byte kind, byte tier, byte texNo = 0)
	{
	}

	private void CreatBlobProjector()
	{
	}

	private void SetSubMeshMaterials(MeshRenderer meshRenderer, Mesh animesh, ESheetMeshTexKind kind, byte sKind)
	{
	}

	private ushort CreateActor(byte kind, byte tier, byte texNo)
	{
		return 0;
	}

	public virtual bool PlayAnim(ESheetMeshAnim eAnim, ESAWrapMode mode = ESAWrapMode.LOOP, bool bRandomStartPoint = true, bool bForceReset = false)
	{
		return false;
	}

	public virtual void SampleAnimation(ESheetMeshAnim eAnim, float sampleTime)
	{
	}

	public virtual void Update()
	{
	}

	private void OnDestroy()
	{
	}
}
