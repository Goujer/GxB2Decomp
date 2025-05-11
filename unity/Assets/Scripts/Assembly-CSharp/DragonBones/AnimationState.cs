using System.Collections.Generic;

namespace DragonBones
{
	public class AnimationState : BaseObject
	{
		public bool actionEnabled;

		public bool additiveBlending;

		public bool displayControl;

		public bool resetToPose;

		public int playTimes;

		public int layer;

		public float timeScale;

		public float weight;

		public float autoFadeOutTime;

		public float fadeTotalTime;

		public string name;

		public string group;

		private int _timelineDirty;

		internal int _playheadState;

		internal int _fadeState;

		internal int _subFadeState;

		internal float _position;

		internal float _duration;

		private float _fadeTime;

		private float _time;

		internal float _fadeProgress;

		private float _weightResult;

		internal readonly BlendState _blendState;

		private readonly List<string> _boneMask;

		private readonly List<BoneTimelineState> _boneTimelines;

		private readonly List<SlotTimelineState> _slotTimelines;

		private readonly List<ConstraintTimelineState> _constraintTimelines;

		private readonly List<TimelineState> _poseTimelines;

		private readonly Dictionary<string, BonePose> _bonePoses;

		public AnimationData _animationData;

		private Armature _armature;

		internal ActionTimelineState _actionTimeline;

		private ZOrderTimelineState _zOrderTimeline;

		public AnimationState _parent;

		public bool isFadeIn
		{
			get
			{
				return false;
			}
		}

		public bool isFadeOut
		{
			get
			{
				return false;
			}
		}

		public bool isFadeComplete
		{
			get
			{
				return false;
			}
		}

		public bool isPlaying
		{
			get
			{
				return false;
			}
		}

		public bool isCompleted
		{
			get
			{
				return false;
			}
		}

		public int currentPlayTimes
		{
			get
			{
				return 0;
			}
		}

		public float totalTime
		{
			get
			{
				return 0f;
			}
		}

		public float currentTime
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		protected override void _OnClear()
		{
		}

		private void _UpdateTimelines()
		{
		}

		private void _UpdateBoneAndSlotTimelines()
		{
		}

		private void _AdvanceFadeTime(float passedTime)
		{
		}

		internal void Init(Armature armature, AnimationData animationData, AnimationConfig animationConfig)
		{
		}

		internal void AdvanceTime(float passedTime, float cacheFrameRate)
		{
		}

		public void Play()
		{
		}

		public void Stop()
		{
		}

		public void FadeOut(float fadeOutTime, bool pausePlayhead = true)
		{
		}

		public bool ContainsBoneMask(string boneName)
		{
			return false;
		}

		public void AddBoneMask(string boneName, bool recursive = true)
		{
		}

		public void RemoveBoneMask(string boneName, bool recursive = true)
		{
		}

		public void RemoveAllBoneMask()
		{
		}
	}
}
