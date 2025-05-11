using UnityEngine.Playables;

namespace Spine.Unity.Playables
{
	public class SpineAnimationStateMixerBehaviour : PlayableBehaviour
	{
		private float[] lastInputWeights;

		public override void ProcessFrame(Playable playable, FrameData info, object playerData)
		{
		}

		public void PreviewEditModePose(Playable playable, SkeletonAnimation spineComponent)
		{
		}
	}
}
