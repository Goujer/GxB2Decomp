namespace Spine
{
	public class EventTimeline : Timeline
	{
		internal float[] frames;

		private Event[] events;

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

		public Event[] Events
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

		public EventTimeline(int frameCount)
		{
		}

		public void SetFrame(int frameIndex, Event e)
		{
		}

		public void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
