namespace Spine
{
	public class DrawOrderTimeline : Timeline
	{
		internal float[] frames;

		private int[][] drawOrders;

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

		public int[][] DrawOrders
		{
			get
			{
				return null;
			}
			set
			{
			}
		}

		public int FrameCount
		{
			get
			{
				return 0;
			}
		}

		public int PropertyId
		{
			get
			{
				return 0;
			}
		}

		public DrawOrderTimeline(int frameCount)
		{
		}

		public void SetFrame(int frameIndex, float time, int[] drawOrder)
		{
		}

		public void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
