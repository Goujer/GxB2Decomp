namespace DragonBones
{
	public class EventObject : BaseObject
	{
		public const string START = "start";

		public const string LOOP_COMPLETE = "loopComplete";

		public const string COMPLETE = "complete";

		public const string FADE_IN = "fadeIn";

		public const string FADE_IN_COMPLETE = "fadeInComplete";

		public const string FADE_OUT = "fadeOut";

		public const string FADE_OUT_COMPLETE = "fadeOutComplete";

		public const string FRAME_EVENT = "frameEvent";

		public const string SOUND_EVENT = "soundEvent";

		public float time;

		public string type;

		public string name;

		public Armature armature;

		public Bone bone;

		public Slot slot;

		public AnimationState animationState;

		public ActionData actionData;

		public UserData data;

		public static void ActionDataToInstance(ActionData data, EventObject instance, Armature armature)
		{
		}

		protected override void _OnClear()
		{
		}
	}
}
