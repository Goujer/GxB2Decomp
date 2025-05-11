using System.Collections.Generic;

namespace DragonBones
{
	public abstract class DataParser
	{
		protected const string DATA_VERSION_2_3 = "2.3";

		protected const string DATA_VERSION_3_0 = "3.0";

		protected const string DATA_VERSION_4_0 = "4.0";

		protected const string DATA_VERSION_4_5 = "4.5";

		protected const string DATA_VERSION_5_0 = "5.0";

		protected const string DATA_VERSION_5_5 = "5.5";

		protected const string DATA_VERSION = "5.5";

		protected static readonly List<string> DATA_VERSIONS;

		protected const string TEXTURE_ATLAS = "textureAtlas";

		protected const string SUB_TEXTURE = "SubTexture";

		protected const string FORMAT = "format";

		protected const string IMAGE_PATH = "imagePath";

		protected const string WIDTH = "width";

		protected const string HEIGHT = "height";

		protected const string ROTATED = "rotated";

		protected const string FRAME_X = "frameX";

		protected const string FRAME_Y = "frameY";

		protected const string FRAME_WIDTH = "frameWidth";

		protected const string FRAME_HEIGHT = "frameHeight";

		protected const string DRADON_BONES = "dragonBones";

		protected const string USER_DATA = "userData";

		protected const string ARMATURE = "armature";

		protected const string BONE = "bone";

		protected const string SLOT = "slot";

		protected const string CONSTRAINT = "constraint";

		protected const string IK = "ik";

		protected const string SKIN = "skin";

		protected const string DISPLAY = "display";

		protected const string ANIMATION = "animation";

		protected const string Z_ORDER = "zOrder";

		protected const string FFD = "ffd";

		protected const string FRAME = "frame";

		protected const string TRANSLATE_FRAME = "translateFrame";

		protected const string ROTATE_FRAME = "rotateFrame";

		protected const string SCALE_FRAME = "scaleFrame";

		protected const string DISPLAY_FRAME = "displayFrame";

		protected const string COLOR_FRAME = "colorFrame";

		protected const string DEFAULT_ACTIONS = "defaultActions";

		protected const string ACTIONS = "actions";

		protected const string EVENTS = "events";

		protected const string INTS = "ints";

		protected const string FLOATS = "floats";

		protected const string STRINGS = "strings";

		protected const string CANVAS = "canvas";

		protected const string TRANSFORM = "transform";

		protected const string PIVOT = "pivot";

		protected const string AABB = "aabb";

		protected const string COLOR = "color";

		protected const string VERSION = "version";

		protected const string COMPATIBLE_VERSION = "compatibleVersion";

		protected const string FRAME_RATE = "frameRate";

		protected const string TYPE = "type";

		protected const string SUB_TYPE = "subType";

		protected const string NAME = "name";

		protected const string PARENT = "parent";

		protected const string TARGET = "target";

		protected const string STAGE = "stage";

		protected const string SHARE = "share";

		protected const string PATH = "path";

		protected const string LENGTH = "length";

		protected const string DISPLAY_INDEX = "displayIndex";

		protected const string BLEND_MODE = "blendMode";

		protected const string INHERIT_TRANSLATION = "inheritTranslation";

		protected const string INHERIT_ROTATION = "inheritRotation";

		protected const string INHERIT_SCALE = "inheritScale";

		protected const string INHERIT_REFLECTION = "inheritReflection";

		protected const string INHERIT_ANIMATION = "inheritAnimation";

		protected const string INHERIT_DEFORM = "inheritDeform";

		protected const string BEND_POSITIVE = "bendPositive";

		protected const string CHAIN = "chain";

		protected const string WEIGHT = "weight";

		protected const string FADE_IN_TIME = "fadeInTime";

		protected const string PLAY_TIMES = "playTimes";

		protected const string SCALE = "scale";

		protected const string OFFSET = "offset";

		protected const string POSITION = "position";

		protected const string DURATION = "duration";

		protected const string TWEEN_TYPE = "tweenType";

		protected const string TWEEN_EASING = "tweenEasing";

		protected const string TWEEN_ROTATE = "tweenRotate";

		protected const string TWEEN_SCALE = "tweenScale";

		protected const string CLOCK_WISE = "clockwise";

		protected const string CURVE = "curve";

		protected const string SOUND = "sound";

		protected const string EVENT = "event";

		protected const string ACTION = "action";

		protected const string X = "x";

		protected const string Y = "y";

		protected const string SKEW_X = "skX";

		protected const string SKEW_Y = "skY";

		protected const string SCALE_X = "scX";

		protected const string SCALE_Y = "scY";

		protected const string VALUE = "value";

		protected const string ROTATE = "rotate";

		protected const string SKEW = "skew";

		protected const string ALPHA_OFFSET = "aO";

		protected const string RED_OFFSET = "rO";

		protected const string GREEN_OFFSET = "gO";

		protected const string BLUE_OFFSET = "bO";

		protected const string ALPHA_MULTIPLIER = "aM";

		protected const string RED_MULTIPLIER = "rM";

		protected const string GREEN_MULTIPLIER = "gM";

		protected const string BLUE_MULTIPLIER = "bM";

		protected const string UVS = "uvs";

		protected const string VERTICES = "vertices";

		protected const string TRIANGLES = "triangles";

		protected const string WEIGHTS = "weights";

		protected const string SLOT_POSE = "slotPose";

		protected const string BONE_POSE = "bonePose";

		protected const string GOTO_AND_PLAY = "gotoAndPlay";

		protected const string DEFAULT_NAME = "default";

		public DataParser()
		{
		}

		protected static ArmatureType _GetArmatureType(string value)
		{
			return default(ArmatureType);
		}

		protected static DisplayType _GetDisplayType(string value)
		{
			return default(DisplayType);
		}

		protected static BoundingBoxType _GetBoundingBoxType(string value)
		{
			return default(BoundingBoxType);
		}

		protected static ActionType _GetActionType(string value)
		{
			return default(ActionType);
		}

		protected static BlendMode _GetBlendMode(string value)
		{
			return default(BlendMode);
		}

		public abstract DragonBonesData ParseDragonBonesData(object rawData, float scale);

		public abstract bool ParseTextureAtlasData(object rawData, TextureAtlasData textureAtlasData, float scale);
	}
}
