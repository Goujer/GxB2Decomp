using System;
using System.Collections.Generic;
using UnityEngine;

namespace Spine.Unity
{
	public class SkeletonAnimator : SkeletonRenderer, ISkeletonAnimation
	{
		[Serializable]
		public class MecanimTranslator
		{
			public enum MixMode
			{
				AlwaysMix = 0,
				MixNext = 1,
				SpineStyle = 2
			}

			protected class ClipInfos
			{
				public bool isInterruptionActive;

				public bool isLastFrameOfInterruption;

				public int clipInfoCount;

				public int nextClipInfoCount;

				public int interruptingClipInfoCount;

				public readonly List<AnimatorClipInfo> clipInfos;

				public readonly List<AnimatorClipInfo> nextClipInfos;

				public readonly List<AnimatorClipInfo> interruptingClipInfos;

				public AnimatorStateInfo stateInfo;

				public AnimatorStateInfo nextStateInfo;

				public AnimatorStateInfo interruptingStateInfo;

				public float interruptingClipTimeAddition;
			}

			private class AnimationClipEqualityComparer : IEqualityComparer<AnimationClip>
			{
				internal static readonly IEqualityComparer<AnimationClip> Instance;

				public bool Equals(AnimationClip x, AnimationClip y)
				{
					return false;
				}

				public int GetHashCode(AnimationClip o)
				{
					return 0;
				}
			}

			private class IntEqualityComparer : IEqualityComparer<int>
			{
				internal static readonly IEqualityComparer<int> Instance;

				public bool Equals(int x, int y)
				{
					return false;
				}

				public int GetHashCode(int o)
				{
					return 0;
				}
			}

			public bool autoReset;

			public MixMode[] layerMixModes;

			private readonly Dictionary<int, Animation> animationTable;

			private readonly Dictionary<AnimationClip, int> clipNameHashCodeTable;

			private readonly List<Animation> previousAnimations;

			protected ClipInfos[] layerClipInfos;

			private Animator animator;

			public Animator Animator
			{
				get
				{
					return null;
				}
			}

			public void Initialize(Animator animator, SkeletonDataAsset skeletonDataAsset)
			{
			}

			public void Apply(Skeleton skeleton)
			{
			}

			private static float AnimationTime(float normalizedTime, float clipLength, bool loop, bool reversed)
			{
				return 0f;
			}

			private static float AnimationTime(float normalizedTime, float clipLength, bool reversed)
			{
				return 0f;
			}

			private void InitClipInfosForLayers()
			{
			}

			private void ClearClipInfosForLayers()
			{
			}

			private void GetStateUpdatesFromAnimator(int layer)
			{
			}

			private void GetAnimatorClipInfos(int layer, out bool isInterruptionActive, out int clipInfoCount, out int nextClipInfoCount, out int interruptingClipInfoCount, out IList<AnimatorClipInfo> clipInfo, out IList<AnimatorClipInfo> nextClipInfo, out IList<AnimatorClipInfo> interruptingClipInfo, out bool shallInterpolateWeightTo1)
			{
				isInterruptionActive = default(bool);
				clipInfoCount = default(int);
				nextClipInfoCount = default(int);
				interruptingClipInfoCount = default(int);
				clipInfo = null;
				nextClipInfo = null;
				interruptingClipInfo = null;
				shallInterpolateWeightTo1 = default(bool);
			}

			private void GetAnimatorStateInfos(int layer, out bool isInterruptionActive, out AnimatorStateInfo stateInfo, out AnimatorStateInfo nextStateInfo, out AnimatorStateInfo interruptingStateInfo, out float interruptingClipTimeAddition)
			{
				isInterruptionActive = default(bool);
				stateInfo = default(AnimatorStateInfo);
				nextStateInfo = default(AnimatorStateInfo);
				interruptingStateInfo = default(AnimatorStateInfo);
				interruptingClipTimeAddition = default(float);
			}

			private Animation GetAnimation(AnimationClip clip)
			{
				return null;
			}
		}

		[SerializeField]
		protected MecanimTranslator translator;

		public MecanimTranslator Translator
		{
			get
			{
				return null;
			}
		}

		protected event UpdateBonesDelegate _UpdateLocal
		{
			add
			{
			}
			remove
			{
			}
		}

		protected event UpdateBonesDelegate _UpdateWorld
		{
			add
			{
			}
			remove
			{
			}
		}

		protected event UpdateBonesDelegate _UpdateComplete
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateLocal
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateWorld
		{
			add
			{
			}
			remove
			{
			}
		}

		public event UpdateBonesDelegate UpdateComplete
		{
			add
			{
			}
			remove
			{
			}
		}

		public override void Initialize(bool overwrite)
		{
		}

		public void Update()
		{
		}
	}
}
