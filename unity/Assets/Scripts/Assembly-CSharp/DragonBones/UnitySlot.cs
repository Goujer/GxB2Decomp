using UnityEngine;

namespace DragonBones
{
	public class UnitySlot : Slot
	{
		internal const float Z_OFFSET = 0.001f;

		private static readonly int[] TRIANGLES;

		private static Vector3 _helpVector3;

		internal GameObject _renderDisplay;

		internal UnityUGUIDisplay _uiDisplay;

		internal MeshBuffer _meshBuffer;

		internal MeshRenderer _meshRenderer;

		internal MeshFilter _meshFilter;

		internal bool _isIgnoreCombineMesh;

		internal bool _isCombineMesh;

		internal int _sumMeshIndex;

		internal int _verticeOrder;

		internal int _verticeOffset;

		internal UnityCombineMeshs _combineMesh;

		internal bool _isActive;

		private bool _skewed;

		private UnityArmatureComponent _proxy;

		private BlendMode _currentBlendMode;

		public Mesh mesh
		{
			get
			{
				return null;
			}
		}

		public MeshRenderer meshRenderer
		{
			get
			{
				return null;
			}
		}

		public UnityTextureAtlasData currentTextureAtlasData
		{
			get
			{
				return null;
			}
		}

		public GameObject renderDisplay
		{
			get
			{
				return null;
			}
		}

		public UnityArmatureComponent proxy
		{
			get
			{
				return null;
			}
		}

		public bool isIgnoreCombineMesh
		{
			get
			{
				return false;
			}
		}

		protected override void _OnClear()
		{
		}

		protected override void _InitDisplay(object value, bool isRetain)
		{
		}

		protected override void _DisposeDisplay(object value, bool isRelease)
		{
		}

		protected override void _OnUpdateDisplay()
		{
		}

		protected override void _AddDisplay()
		{
		}

		protected override void _ReplaceDisplay(object value)
		{
		}

		protected override void _RemoveDisplay()
		{
		}

		protected override void _UpdateZOrder()
		{
		}

		internal void _SetZorder(Vector3 zorderPos)
		{
		}

		public void DisallowCombineMesh()
		{
		}

		internal void CancelCombineMesh()
		{
		}

		private void _CombineMesh()
		{
		}

		internal override void _UpdateVisible()
		{
		}

		internal override void _UpdateBlendMode()
		{
		}

		protected override void _UpdateColor()
		{
		}

		protected override void _UpdateFrame()
		{
		}

		protected override void _IdentityTransform()
		{
		}

		protected override void _UpdateMesh()
		{
		}

		protected override void _UpdateTransform()
		{
		}
	}
}
