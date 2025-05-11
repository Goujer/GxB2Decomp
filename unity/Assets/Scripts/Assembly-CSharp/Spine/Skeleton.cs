using System.Collections.Generic;

namespace Spine
{
	public class Skeleton
	{
		internal SkeletonData data;

		internal ExposedList<Bone> bones;

		internal ExposedList<Slot> slots;

		internal ExposedList<Slot> drawOrder;

		internal ExposedList<IkConstraint> ikConstraints;

		internal ExposedList<TransformConstraint> transformConstraints;

		internal ExposedList<PathConstraint> pathConstraints;

		internal ExposedList<IUpdatable> updateCache;

		internal ExposedList<Bone> updateCacheReset;

		internal Skin skin;

		internal float r;

		internal float g;

		internal float b;

		internal float a;

		internal float time;

		internal bool flipX;

		internal bool flipY;

		internal float x;

		internal float y;

		private Dictionary<int, string> changeSlots;

		private Dictionary<int, bool> hideSlots_;

		public SkeletonData Data
		{
			get
			{
				return null;
			}
		}

		public ExposedList<Bone> Bones
		{
			get
			{
				return null;
			}
		}

		public ExposedList<IUpdatable> UpdateCacheList
		{
			get
			{
				return null;
			}
		}

		public ExposedList<Slot> Slots
		{
			get
			{
				return null;
			}
		}

		public ExposedList<Slot> DrawOrder
		{
			get
			{
				return null;
			}
		}

		public ExposedList<IkConstraint> IkConstraints
		{
			get
			{
				return null;
			}
		}

		public ExposedList<PathConstraint> PathConstraints
		{
			get
			{
				return null;
			}
		}

		public ExposedList<TransformConstraint> TransformConstraints
		{
			get
			{
				return null;
			}
		}

		public Skin Skin
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public float R
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float G
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float B
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float A
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Time
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float X
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public float Y
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public bool FlipX
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public bool FlipY
		{
			get
			{
				return false;
			}
			set
			{
			}
		}

		public Bone RootBone
		{
			get
			{
				return null;
			}
		}

		public Skeleton(SkeletonData data)
		{
		}

		public Dictionary<int, string> GetChangeSlots()
		{
			return null;
		}

		public void SetSlot(string slotName, string attachmentName)
		{
		}

		public void UpdateCache()
		{
		}

		private void SortIkConstraint(IkConstraint constraint)
		{
		}

		private void SortPathConstraint(PathConstraint constraint)
		{
		}

		private void SortTransformConstraint(TransformConstraint constraint)
		{
		}

		private void SortPathConstraintAttachment(Skin skin, int slotIndex, Bone slotBone)
		{
		}

		private void SortPathConstraintAttachment(Attachment attachment, Bone slotBone)
		{
		}

		private void SortBone(Bone bone)
		{
		}

		private static void SortReset(ExposedList<Bone> bones)
		{
		}

		public void UpdateWorldTransform()
		{
		}

		public void SetToSetupPose()
		{
		}

		public void SetBonesToSetupPose()
		{
		}

		public void SetSlotsToSetupPose()
		{
		}

		public Bone FindBone(string boneName)
		{
			return null;
		}

		public int FindBoneIndex(string boneName)
		{
			return 0;
		}

		public Slot FindSlot(string slotName)
		{
			return null;
		}

		public int FindSlotIndex(string slotName)
		{
			return 0;
		}

		public void SetSkin(string skinName)
		{
		}

		public void SetSkin(Skin newSkin)
		{
		}

		public Attachment GetAttachment(string slotName, string attachmentName)
		{
			return null;
		}

		public Attachment GetAttachment(int slotIndex, string attachmentName)
		{
			return null;
		}

		public void ChangeAttachment(string slotName, string attachmentName, Attachment attachment)
		{
		}

		public void removeAttachment(string slotName, string attachmentName)
		{
		}

		public void HideSlots(string slotName)
		{
		}

		public void SetAttachment(string slotName, string attachmentName)
		{
		}

		public void SwitchAttachment(string slotName, string attachmentName1, string attachmentName2)
		{
		}

		public IkConstraint FindIkConstraint(string constraintName)
		{
			return null;
		}

		public TransformConstraint FindTransformConstraint(string constraintName)
		{
			return null;
		}

		public PathConstraint FindPathConstraint(string constraintName)
		{
			return null;
		}

		public void Update(float delta)
		{
		}

		public void GetBounds(out float x, out float y, out float width, out float height, ref float[] vertexBuffer)
		{
			x = default(float);
			y = default(float);
			width = default(float);
			height = default(float);
		}
	}
}
