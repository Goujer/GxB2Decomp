using System.Collections.Generic;

namespace DragonBones
{
	public class Animation : BaseObject
	{
		public float timeScale;

		private bool _lockUpdate;

		private bool _animationDirty;

		private float _inheritTimeScale;

		private readonly List<string> _animationNames;

		private readonly List<AnimationState> _animationStates;

		private readonly Dictionary<string, AnimationData> _animations;

		private Armature _armature;

		private AnimationConfig _animationConfig;

		private AnimationState _lastAnimationState;

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

		public string lastAnimationName
		{
			get
			{
				return null;
			}
		}

		public List<string> animationNames
		{
			get
			{
				return null;
			}
		}

		public Dictionary<string, AnimationData> animations
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public AnimationConfig animationConfig
		{
			get
			{
				return null;
			}
		}

		public AnimationState lastAnimationState
		{
			get
			{
				return null;
			}
		}

		protected override void _OnClear()
		{
		}

		private void _FadeOut(AnimationConfig animationConfig)
		{
		}

		internal void Init(Armature armature)
		{
		}

		internal void AdvanceTime(float passedTime)
		{
		}

		public void Reset()
		{
		}

		public void Stop(string animationName = null)
		{
		}

		public AnimationState PlayConfig(AnimationConfig animationConfig)
		{
			return null;
		}

		public AnimationState Play(string animationName = null, int playTimes = -1)
		{
			return null;
		}

		public AnimationState FadeIn(string animationName, float fadeInTime = -1f, int playTimes = -1, int layer = 0, string group = null, AnimationFadeOutMode fadeOutMode = AnimationFadeOutMode.SameLayerAndGroup)
		{
			return null;
		}

		public AnimationState GotoAndPlayByTime(string animationName, float time = 0f, int playTimes = -1)
		{
			return null;
		}

		public AnimationState GotoAndPlayByFrame(string animationName, uint frame = 0u, int playTimes = -1)
		{
			return null;
		}

		public AnimationState GotoAndPlayByProgress(string animationName, float progress = 0f, int playTimes = -1)
		{
			return null;
		}

		public AnimationState GotoAndStopByTime(string animationName, float time = 0f)
		{
			return null;
		}

		public AnimationState GotoAndStopByFrame(string animationName, uint frame = 0u)
		{
			return null;
		}

		public AnimationState GotoAndStopByProgress(string animationName, float progress = 0f)
		{
			return null;
		}

		public AnimationState GetState(string animationName)
		{
			return null;
		}

		public bool HasAnimation(string animationName)
		{
			return false;
		}

		public List<AnimationState> GetStates()
		{
			return null;
		}
	}
}
