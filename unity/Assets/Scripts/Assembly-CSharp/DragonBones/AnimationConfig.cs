using System.Collections.Generic;

namespace DragonBones
{
	public class AnimationConfig : BaseObject
	{
		public bool pauseFadeOut;

		public AnimationFadeOutMode fadeOutMode;

		public TweenType fadeOutTweenType;

		public float fadeOutTime;

		public bool pauseFadeIn;

		public bool actionEnabled;

		public bool additiveBlending;

		public bool displayControl;

		public bool resetToPose;

		public TweenType fadeInTweenType;

		public int playTimes;

		public int layer;

		public float position;

		public float duration;

		public float timeScale;

		public float weight;

		public float fadeInTime;

		public float autoFadeOutTime;

		public string name;

		public string animation;

		public string group;

		public readonly List<string> boneMask;

		protected override void _OnClear()
		{
		}

		public void Clear()
		{
		}

		public void CopyFrom(AnimationConfig value)
		{
		}

		public bool ContainsBoneMask(string boneName)
		{
			return false;
		}

		public void AddBoneMask(Armature armature, string boneName, bool recursive = false)
		{
		}

		public void RemoveBoneMask(Armature armature, string name, bool recursive = true)
		{
		}
	}
}
