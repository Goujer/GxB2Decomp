using System.Collections.Generic;

namespace DragonBones
{
	public class AnimationData : BaseObject
	{
		public uint frameIntOffset;

		public uint frameFloatOffset;

		public uint frameOffset;

		public uint frameCount;

		public uint playTimes;

		public float duration;

		public float scale;

		public float fadeInTime;

		public float cacheFrameRate;

		public string name;

		public readonly List<bool> cachedFrames;

		public readonly Dictionary<string, List<TimelineData>> boneTimelines;

		public readonly Dictionary<string, List<TimelineData>> slotTimelines;

		public readonly Dictionary<string, List<TimelineData>> constraintTimelines;

		public readonly Dictionary<string, List<int>> boneCachedFrameIndices;

		public readonly Dictionary<string, List<int>> slotCachedFrameIndices;

		public TimelineData actionTimeline;

		public TimelineData zOrderTimeline;

		public ArmatureData parent;

		protected override void _OnClear()
		{
		}

		public void CacheFrames(float frameRate)
		{
		}

		public void AddBoneTimeline(BoneData bone, TimelineData tiemline)
		{
		}

		public void AddSlotTimeline(SlotData slot, TimelineData timeline)
		{
		}

		public void AddConstraintTimeline(ConstraintData constraint, TimelineData timeline)
		{
		}

		public List<TimelineData> GetBoneTimelines(string timelineName)
		{
			return null;
		}

		public List<TimelineData> GetSlotTimelines(string timelineName)
		{
			return null;
		}

		public List<TimelineData> GetConstraintTimelines(string timelineName)
		{
			return null;
		}

		public List<int> GetBoneCachedFrameIndices(string boneName)
		{
			return null;
		}

		public List<int> GetSlotCachedFrameIndices(string slotName)
		{
			return null;
		}
	}
}
