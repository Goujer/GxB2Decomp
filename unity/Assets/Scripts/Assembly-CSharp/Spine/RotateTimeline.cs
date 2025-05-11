namespace Spine
{
	public class RotateTimeline : CurveTimeline
	{
		public const int ENTRIES = 2;

		internal const int PREV_TIME = -2;

		internal const int PREV_ROTATION = -1;

		internal const int ROTATION = 1;

		internal int boneIndex;

		internal float[] frames;

		public int BoneIndex
		{
			get
			{
				return 0;
			}
			set
			{
			}
		}

		public float[] Frames
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public override int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public RotateTimeline(int frameCount)
			: base(0)
		{
		}

		public void SetFrame(int frameIndex, float time, float degrees)
		{
		}

		public override void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
