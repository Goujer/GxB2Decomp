using System.Collections.Generic;

namespace DragonBones
{
	public abstract class Slot : TransformObject
	{
		public string displayController;

		protected bool _displayDirty;

		protected bool _zOrderDirty;

		protected bool _visibleDirty;

		protected bool _blendModeDirty;

		internal bool _colorDirty;

		internal bool _transformDirty;

		protected bool _visible;

		internal BlendMode _blendMode;

		protected int _displayIndex;

		protected int _animationDisplayIndex;

		internal int _zOrder;

		protected int _cachedFrameIndex;

		internal float _pivotX;

		internal float _pivotY;

		protected readonly Matrix _localMatrix;

		internal readonly ColorTransform _colorTransform;

		internal readonly List<DisplayData> _displayDatas;

		protected readonly List<object> _displayList;

		internal SlotData _slotData;

		protected List<DisplayData> _rawDisplayDatas;

		protected DisplayData _displayData;

		protected BoundingBoxData _boundingBoxData;

		protected TextureData _textureData;

		public DeformVertices _deformVertices;

		protected object _rawDisplay;

		protected object _meshDisplay;

		protected object _display;

		protected Armature _childArmature;

		protected Bone _parent;

		internal List<int> _cachedFrameIndices;

		public bool visible
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public int displayIndex
		{
			get
			{
				return 0;
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

		public List<object> displayList
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public SlotData slotData
		{
			get
			{
				return null;
			}
		}

		public List<DisplayData> rawDisplayDatas
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public BoundingBoxData boundingBoxData
		{
			get
			{
				return null;
			}
		}

		public object rawDisplay
		{
			get
			{
				return null;
			}
		}

		public object meshDisplay
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
			set
			{
			}
		}

		public Armature childArmature
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public Bone parent
		{
			get
			{
				return null;
			}
		}

		public Slot()
		{
		}

		protected override void _OnClear()
		{
		}

		protected abstract void _InitDisplay(object value, bool isRetain);

		protected abstract void _DisposeDisplay(object value, bool isRelease);

		protected abstract void _OnUpdateDisplay();

		protected abstract void _AddDisplay();

		protected abstract void _ReplaceDisplay(object value);

		protected abstract void _RemoveDisplay();

		protected abstract void _UpdateZOrder();

		internal abstract void _UpdateVisible();

		internal abstract void _UpdateBlendMode();

		protected abstract void _UpdateColor();

		protected abstract void _UpdateFrame();

		protected abstract void _UpdateMesh();

		protected abstract void _UpdateTransform();

		protected abstract void _IdentityTransform();

		protected DisplayData _GetDefaultRawDisplayData(int displayIndex)
		{
			return null;
		}

		protected void _UpdateDisplayData()
		{
		}

		protected void _UpdateDisplay()
		{
		}

		protected void _UpdateGlobalTransformMatrix(bool isCache)
		{
		}

		internal bool _SetDisplayIndex(int value, bool isAnimation = false)
		{
			return false;
		}

		internal bool _SetZorder(int value)
		{
			return false;
		}

		internal bool _SetColor(ColorTransform value)
		{
			return false;
		}

		internal bool _SetDisplayList(List<object> value)
		{
			return false;
		}

		internal virtual void Init(SlotData slotData, Armature armatureValue, object rawDisplay, object meshDisplay)
		{
		}

		internal void Update(int cacheFrameIndex)
		{
		}

		public void UpdateTransformAndMatrix()
		{
		}

		internal void ReplaceDisplayData(DisplayData value, int displayIndex = -1)
		{
		}

		public bool ContainsPoint(float x, float y)
		{
			return false;
		}

		public int IntersectsSegment(float xA, float yA, float xB, float yB, Point intersectionPointA = null, Point intersectionPointB = null, Point normalRadians = null)
		{
			return 0;
		}

		public void InvalidUpdate()
		{
		}
	}
}
