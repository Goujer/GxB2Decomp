using System.Collections.Generic;

namespace DragonBones
{
	public class ArmatureData : BaseObject
	{
		public ArmatureType type;

		public uint frameRate;

		public uint cacheFrameRate;

		public float scale;

		public string name;

		public readonly Rectangle aabb;

		public readonly List<string> animationNames;

		public readonly List<BoneData> sortedBones;

		public readonly List<SlotData> sortedSlots;

		public readonly List<ActionData> defaultActions;

		public readonly List<ActionData> actions;

		public readonly Dictionary<string, BoneData> bones;

		public readonly Dictionary<string, SlotData> slots;

		public readonly Dictionary<string, ConstraintData> constraints;

		public readonly Dictionary<string, SkinData> skins;

		public readonly Dictionary<string, AnimationData> animations;

		public SkinData defaultSkin;

		public AnimationData defaultAnimation;

		public CanvasData canvas;

		public UserData userData;

		public DragonBonesData parent;

		protected override void _OnClear()
		{
		}

		public void SortBones()
		{
		}

		public void CacheFrames(uint frameRate)
		{
		}

		public int SetCacheFrame(Matrix globalTransformMatrix, Transform transform)
		{
			return 0;
		}

		public void GetCacheFrame(Matrix globalTransformMatrix, Transform transform, int arrayOffset)
		{
		}

		public void AddBone(BoneData value)
		{
		}

		public void AddSlot(SlotData value)
		{
		}

		public void AddConstraint(ConstraintData value)
		{
		}

		public void AddSkin(SkinData value)
		{
		}

		public void AddAnimation(AnimationData value)
		{
		}

		internal void AddAction(ActionData value, bool isDefault)
		{
		}

		public BoneData GetBone(string boneName)
		{
			return null;
		}

		public SlotData GetSlot(string slotName)
		{
			return null;
		}

		public ConstraintData GetConstraint(string constraintName)
		{
			return null;
		}

		public SkinData GetSkin(string skinName)
		{
			return null;
		}

		public MeshDisplayData GetMesh(string skinName, string slotName, string meshName)
		{
			return null;
		}

		public AnimationData GetAnimation(string animationName)
		{
			return null;
		}
	}
}
