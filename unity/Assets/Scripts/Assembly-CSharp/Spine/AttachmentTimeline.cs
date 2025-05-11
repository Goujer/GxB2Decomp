namespace Spine
{
	public class AttachmentTimeline : Timeline
	{
		internal int slotIndex;

		internal float[] frames;

		internal string[] attachmentNames;

		public int SlotIndex
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

		public string[] AttachmentNames
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

		public AttachmentTimeline(int frameCount)
		{
		}

		public void SetFrame(int frameIndex, float time, string attachmentName)
		{
		}

		public string GetAttachmentName(Skeleton skeleton, int slotIndex, string attachmentName)
		{
			return null;
		}

		public void Apply(Skeleton skeleton, float lastTime, float time, ExposedList<Event> firedEvents, float alpha, MixPose pose, MixDirection direction)
		{
		}
	}
}
