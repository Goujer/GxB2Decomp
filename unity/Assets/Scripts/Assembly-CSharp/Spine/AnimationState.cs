using System.Collections;
using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace Spine
{
	public class AnimationState
	{
		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void TrackEntryDelegate(TrackEntry trackEntry);

		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate void TrackEntryEventDelegate(TrackEntry trackEntry, Event e);

		private static readonly Animation EmptyAnimation;

		internal const int Subsequent = 0;

		internal const int First = 1;

		internal const int Dip = 2;

		internal const int DipMix = 3;

		private AnimationStateData data;

		private Hashtable pauseTracks;

		private Pool<TrackEntry> trackEntryPool;

		private readonly ExposedList<TrackEntry> tracks;

		private readonly ExposedList<Event> events;

		private readonly EventQueue queue;

		private readonly HashSet<int> propertyIDs;

		private readonly ExposedList<TrackEntry> mixingTo;

		private bool animationsChanged;

		private float timeScale;

		public AnimationStateData Data
		{
			get
			{
				return null;
			}
		}

		public ExposedList<TrackEntry> Tracks
		{
			get
			{
				return null;
			}
		}

		public float TimeScale
		{
			get
			{
				return 0f;
			}
			set
			{
			}
		}

		public event TrackEntryDelegate Start
		{
			add
			{
			}
			remove
			{
			}
		}

		public event TrackEntryDelegate Interrupt
		{
			add
			{
			}
			remove
			{
			}
		}

		public event TrackEntryDelegate End
		{
			add
			{
			}
			remove
			{
			}
		}

		public event TrackEntryDelegate Dispose
		{
			add
			{
			}
			remove
			{
			}
		}

		public event TrackEntryDelegate Complete
		{
			add
			{
			}
			remove
			{
			}
		}

		public event TrackEntryEventDelegate Event
		{
			add
			{
			}
			remove
			{
			}
		}

		public AnimationState(AnimationStateData data)
		{
		}

		public void Update(float delta)
		{
		}

		private bool UpdateMixingFrom(TrackEntry to, float delta)
		{
			return false;
		}

		public bool Apply(Skeleton skeleton)
		{
			return false;
		}

		private float ApplyMixingFrom(TrackEntry to, Skeleton skeleton, MixPose currentPose)
		{
			return 0f;
		}

		private static void ApplyRotateTimeline(RotateTimeline rotateTimeline, Skeleton skeleton, float time, float alpha, MixPose pose, float[] timelinesRotation, int i, bool firstFrame)
		{
		}

		private void QueueEvents(TrackEntry entry, float animationTime)
		{
		}

		public void ClearTracks()
		{
		}

		public void ClearTracksEvent()
		{
		}

		public void ClearTrackEvent(int trackIndex)
		{
		}

		public void ClearTrack(int trackIndex)
		{
		}

		private void SetCurrent(int index, TrackEntry current, bool interrupt)
		{
		}

		public TrackEntry SetAnimation(int trackIndex, string animationName, bool loop)
		{
			return null;
		}

		public void pause(int trackIndex)
		{
		}

		public void resume(int trackIndex)
		{
		}

		public TrackEntry SetAnimation(int trackIndex, Animation animation, bool loop)
		{
			return null;
		}

		public TrackEntry AddAnimation(int trackIndex, string animationName, bool loop, float delay)
		{
			return null;
		}

		public TrackEntry AddAnimation(int trackIndex, Animation animation, bool loop, float delay)
		{
			return null;
		}

		public TrackEntry SetEmptyAnimation(int trackIndex, float mixDuration)
		{
			return null;
		}

		public TrackEntry AddEmptyAnimation(int trackIndex, float mixDuration, float delay)
		{
			return null;
		}

		public void SetEmptyAnimations(float mixDuration)
		{
		}

		private TrackEntry ExpandToIndex(int index)
		{
			return null;
		}

		private TrackEntry NewTrackEntry(int trackIndex, Animation animation, bool loop, TrackEntry last)
		{
			return null;
		}

		private void DisposeNext(TrackEntry entry)
		{
		}

		private void AnimationsChanged()
		{
		}

		public TrackEntry GetCurrent(int trackIndex)
		{
			return null;
		}

		public override string ToString()
		{
			return null;
		}

		internal void OnStart(TrackEntry entry)
		{
		}

		internal void OnInterrupt(TrackEntry entry)
		{
		}

		internal void OnEnd(TrackEntry entry)
		{
		}

		internal void OnDispose(TrackEntry entry)
		{
		}

		internal void OnComplete(TrackEntry entry)
		{
		}

		internal void OnEvent(TrackEntry entry, Event e)
		{
		}
	}
}
