using System.Collections.Generic;

namespace DragonBones
{
	public class Armature : BaseObject, IAnimatable
	{
		public bool inheritAnimation;

		public object userData;

		private bool _lockUpdate;

		private bool _slotsDirty;

		private bool _zOrderDirty;

		private bool _flipX;

		private bool _flipY;

		internal int _cacheFrameIndex;

		private readonly List<Bone> _bones;

		private readonly List<Slot> _slots;

		internal readonly List<Constraint> _constraints;

		private readonly List<EventObject> _actions;

		public ArmatureData _armatureData;

		private Animation _animation;

		private IArmatureProxy _proxy;

		private object _display;

		internal TextureAtlasData _replaceTextureAtlasData;

		private object _replacedTexture;

		internal DragonBones _dragonBones;

		private WorldClock _clock;

		internal Slot _parent;

		public bool flipX
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public bool flipY
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public uint cacheFrameRate
		{
			get
			{
				return 0u;
			}
			set
			{
			}
		}

		public string name
		{
			get
			{
				return null;
			}
		}

		public ArmatureData armatureData
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

		public IArmatureProxy proxy
		{
			get
			{
				return null;
			}
		}

		public IEventDispatcher<EventObject> eventDispatcher
		{
			get
			{
				return null;
			}
		}

		public object display
		{
			get
			{
				return null;
			}
		}

		public object replacedTexture
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public WorldClock clock
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Slot parent
		{
			get
			{
				return null;
			}
		}

		private static int _OnSortSlots(Slot a, Slot b)
		{
			return 0;
		}

		protected override void _OnClear()
		{
		}

		internal void _SortZOrder(short[] slotIndices, int offset)
		{
		}

		internal void _AddBone(Bone value)
		{
		}

		internal void _AddSlot(Slot value)
		{
		}

		internal void _AddConstraint(Constraint value)
		{
		}

		internal void _BufferAction(EventObject action, bool append)
		{
		}

		public void Dispose()
		{
		}

		internal void Init(ArmatureData armatureData, IArmatureProxy proxy, object display, DragonBones dragonBones)
		{
		}

		public void AdvanceTime(float passedTime)
		{
		}

		public void InvalidUpdate(string boneName = null, bool updateSlot = false)
		{
		}

		public Slot ContainsPoint(float x, float y)
		{
			return null;
		}

		public Slot IntersectsSegment(float xA, float yA, float xB, float yB, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
		{
			return null;
		}

		public Bone GetBone(string name)
		{
			return null;
		}

		public Bone GetBoneByDisplay(object display)
		{
			return null;
		}

		public Slot GetSlot(string name)
		{
			return null;
		}

		public Slot GetSlotByDisplay(object display)
		{
			return null;
		}

		public List<Bone> GetBones()
		{
			return null;
		}

		public List<Slot> GetSlots()
		{
			return null;
		}
	}
}
