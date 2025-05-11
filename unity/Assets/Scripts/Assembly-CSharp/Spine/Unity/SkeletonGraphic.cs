using UnityEngine;
using UnityEngine.UI;

namespace Spine.Unity
{
	[ExecuteInEditMode]
	[DisallowMultipleComponent]
	public class SkeletonGraphic : MaskableGraphic, ISkeletonComponent, IAnimationStateComponent, ISkeletonAnimation, IHasSkeletonDataAsset
	{
		public SkeletonDataAsset skeletonDataAsset;

		public string initialSkinName;

		public bool initialFlipX;

		public bool initialFlipY;

		public string startingAnimation;

		public bool startingLoop;

		public float timeScale;

		public bool freeze;

		public bool unscaledTime;

		private Texture overrideTexture;

		protected Skeleton skeleton;

		protected AnimationState state;

		[SerializeField]
		protected MeshGenerator meshGenerator;

		private DoubleBuffered<MeshRendererBuffers.SmartMesh> meshBuffers;

		private SkeletonRendererInstruction currentInstructions;

		public SkeletonDataAsset SkeletonDataAsset
		{
			get
			{
				return null;
			}
		}

		public Texture OverrideTexture
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override Texture mainTexture
		{
			get
			{
				return null;
			}
		}

		public Skeleton Skeleton
		{
			get
			{
				return null;
			}
			internal set
			{
			}
		}

		public SkeletonData SkeletonData
		{
			get
			{
				return null;
			}
		}

		public bool IsValid
		{
			get
			{
				return false;
			}
		}

		public AnimationState AnimationState
		{
			get
			{
				return null;
			}
		}

		public MeshGenerator MeshGenerator
		{
			get
			{
				return null;
			}
		}

		public event UpdateBonesDelegate UpdateLocal
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateWorld
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateComplete
		{
			add
			{
			}
			remove
			{
			}
		}

		public event MeshGeneratorDelegate OnPostProcessVertices
		{
			add
			{
			}
			remove
			{
			}
		}

		public static SkeletonGraphic NewSkeletonGraphicGameObject(SkeletonDataAsset skeletonDataAsset, Transform parent)
		{
			return null;
		}

		public static SkeletonGraphic AddSkeletonGraphicComponent(GameObject gameObject, SkeletonDataAsset skeletonDataAsset)
		{
			return null;
		}

		protected override void Awake()
		{
		}

		public override void Rebuild(CanvasUpdate update)
		{
		}

		public virtual void Update()
		{
		}

		public virtual void Update(float deltaTime)
		{
		}

		public void LateUpdate()
		{
		}

		public Mesh GetLastMesh()
		{
			return null;
		}

		public void Clear()
		{
		}

		public void Initialize(bool overwrite)
		{
		}

		public void UpdateMesh()
		{
		}
	}
}
