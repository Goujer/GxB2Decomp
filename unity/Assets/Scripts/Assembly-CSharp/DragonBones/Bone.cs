using System;
using System.Collections.Generic;

namespace DragonBones
{
	public class Bone : TransformObject
	{
		internal OffsetMode offsetMode;

		internal readonly Transform animationPose;

		internal bool _transformDirty;

		internal bool _childrenTransformDirty;

		private bool _localDirty;

		internal bool _hasConstraint;

		private bool _visible;

		private int _cachedFrameIndex;

		internal readonly BlendState _blendState;

		internal BoneData _boneData;

		protected Bone _parent;

		internal List<int> _cachedFrameIndices;

		public BoneData boneData
		{
			get
			{
				return null;
			}
		}

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

		public string name
		{
			get
			{
				return null;
			}
		}

		public Bone parent
		{
			get
			{
				return null;
			}
		}

		[Obsolete]
		public Slot slot
		{
			get
			{
				return null;
			}
		}

		protected override void _OnClear()
		{
		}

		private void _UpdateGlobalTransformMatrix(bool isCache)
		{
		}

		internal void Init(BoneData boneData, Armature armatureValue)
		{
		}

		internal void Update(int cacheFrameIndex)
		{
		}

		internal void UpdateByConstraint()
		{
		}

		public void InvalidUpdate()
		{
		}

		public bool Contains(Bone value)
		{
			return false;
		}
	}
}
