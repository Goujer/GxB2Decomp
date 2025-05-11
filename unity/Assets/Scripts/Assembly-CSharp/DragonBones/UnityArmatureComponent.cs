using UnityEngine;
using UnityEngine.Rendering;

namespace DragonBones
{
	[ExecuteInEditMode]
	[DisallowMultipleComponent]
	public class UnityArmatureComponent : DragonBoneEventDispatcher, IArmatureProxy, IEventDispatcher<EventObject>
	{
		public const int ORDER_SPACE = 10;

		public UnityDragonBonesData unityData;

		public string armatureName;

		public bool isUGUI;

		public bool debugDraw;

		private int _lastQueue;

		private UIWidget mRenderTarget;

		private int mTargetDelta;

		internal readonly ColorTransform _colorTransform;

		public string animationName;

		private bool _disposeProxy;

		internal Armature _armature;

		[SerializeField]
		protected int _playTimes;

		[SerializeField]
		protected float _timeScale;

		[SerializeField]
		internal SortingMode _sortingMode;

		[SerializeField]
		internal string _sortingLayerName;

		[SerializeField]
		internal int _sortingOrder;

		[SerializeField]
		internal float _zSpace;

		[SerializeField]
		protected bool _flipX;

		[SerializeField]
		protected bool _flipY;

		[SerializeField]
		protected bool _closeCombineMeshs;

		private bool _hasSortingGroup;

		private Material _debugDrawer;

		internal int _armatureZ;

		internal SortingGroup _sortingGroup;

		public UIWidget renderTarget
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public int targetDelta
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public Armature armature
		{
			get
			{
				return null;
			}
		}

		public Animation animation
		{
			get
			{
				return null;
			}
		}

		public SortingMode sortingMode
		{
			get
			{
				return default(SortingMode);
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

		public float zSpace
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public ColorTransform color
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public SortingGroup sortingGroup
		{
			get
			{
				return null;
			}
		}

		public void DBClear()
		{
		}

		public void DBInit(Armature armature)
		{
		}

		public void DBUpdate()
		{
		}

		public void UpdateUIDragonBones()
		{
		}

		private void CreateLineMaterial()
		{
		}

		private void OnRenderObject()
		{
		}

		public void Dispose(bool disposeProxy = true)
		{
		}

		private void _UpdateSortingGroup()
		{
		}

		private void _UpdateSlotsSorting()
		{
		}

		private void Awake()
		{
		}

		private void Start()
		{
		}

		private void LateUpdate()
		{
		}

		private void OnDestroy()
		{
		}

		private void OpenCombineMeshs()
		{
		}

		public void CloseCombineMeshs()
		{
		}
	}
}
