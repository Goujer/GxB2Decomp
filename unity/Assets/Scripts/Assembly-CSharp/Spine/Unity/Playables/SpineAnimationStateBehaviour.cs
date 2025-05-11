using System;
using UnityEngine.Playables;

namespace Spine.Unity.Playables
{
	[Serializable]
	public class SpineAnimationStateBehaviour : PlayableBehaviour
	{
		public AnimationReferenceAsset animationReference;

		public bool loop;

		public bool customDuration;

		public float mixDuration;

		public float attachmentThreshold;

		public float eventThreshold;

		public float drawOrderThreshold;
	}
}
