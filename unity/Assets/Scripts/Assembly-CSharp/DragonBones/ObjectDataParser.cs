using System;
using System.Collections.Generic;

namespace DragonBones
{
	public class ObjectDataParser : DataParser
	{
		protected int _rawTextureAtlasIndex;

		protected readonly List<BoneData> _rawBones;

		protected DragonBonesData _data;

		protected ArmatureData _armature;

		protected BoneData _bone;

		protected SlotData _slot;

		protected SkinData _skin;

		protected MeshDisplayData _mesh;

		protected AnimationData _animation;

		protected TimelineData _timeline;

		protected List<object> _rawTextureAtlases;

		private int _defaultColorOffset;

		private int _prevClockwise;

		private float _prevRotation;

		private readonly Matrix _helpMatrixA;

		private readonly Matrix _helpMatrixB;

		private readonly Transform _helpTransform;

		private readonly ColorTransform _helpColorTransform;

		private readonly Point _helpPoint;

		private readonly List<float> _helpArray;

		private readonly List<short> _intArray;

		private readonly List<float> _floatArray;

		private readonly List<short> _frameIntArray;

		private readonly List<float> _frameFloatArray;

		private readonly List<short> _frameArray;

		private readonly List<ushort> _timelineArray;

		private readonly List<object> _cacheRawMeshes;

		private readonly List<MeshDisplayData> _cacheMeshes;

		private readonly List<ActionFrame> _actionFrames;

		private readonly Dictionary<string, List<float>> _weightSlotPose;

		private readonly Dictionary<string, List<float>> _weightBonePoses;

		private readonly Dictionary<string, List<uint>> _weightBoneIndices;

		private readonly Dictionary<string, List<BoneData>> _cacheBones;

		private readonly Dictionary<string, List<ActionData>> _slotChildActions;

		protected static bool _GetBoolean(Dictionary<string, object> rawData, string key, bool defaultValue)
		{
			return false;
		}

		protected static uint _GetNumber(Dictionary<string, object> rawData, string key, uint defaultValue)
		{
			return 0u;
		}

		protected static int _GetNumber(Dictionary<string, object> rawData, string key, int defaultValue)
		{
			return 0;
		}

		protected static float _GetNumber(Dictionary<string, object> rawData, string key, float defaultValue)
		{
			return 0f;
		}

		protected static string _GetString(Dictionary<string, object> rawData, string key, string defaultValue)
		{
			return null;
		}

		private void _GetCurvePoint(float x1, float y1, float x2, float y2, float x3, float y3, float x4, float y4, float t, Point result)
		{
		}

		private void _SamplingEasingCurve(float[] curve, List<float> samples)
		{
		}

		private void _ParseActionDataInFrame(object rawData, int frameStart, BoneData bone = null, SlotData slot = null)
		{
		}

		private void _MergeActionFrame(object rawData, int frameStart, ActionType type, BoneData bone = null, SlotData slot = null)
		{
		}

		private int _ParseCacheActionFrame(ActionFrame frame)
		{
			return 0;
		}

		private ArmatureData _ParseArmature(Dictionary<string, object> rawData, float scale)
		{
			return null;
		}

		protected BoneData _ParseBone(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected ConstraintData _ParseIKConstraint(Dictionary<string, object> rawData)
		{
			return null;
		}

		private SlotData _ParseSlot(Dictionary<string, object> rawData, int zOrder)
		{
			return null;
		}

		protected SkinData _ParseSkin(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected DisplayData _ParseDisplay(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected void _ParsePivot(Dictionary<string, object> rawData, ImageDisplayData display)
		{
		}

		protected virtual void _ParseMesh(Dictionary<string, object> rawData, MeshDisplayData mesh)
		{
		}

		protected BoundingBoxData _ParseBoundingBox(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected PolygonBoundingBoxData _ParsePolygonBoundingBox(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected virtual AnimationData _ParseAnimation(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected TimelineData _ParseTimeline(Dictionary<string, object> rawData, List<object> rawFrames, string framesKey, TimelineType type, bool addIntOffset, bool addFloatOffset, uint frameValueCount, Func<Dictionary<string, object>, int, int, int> frameParser)
		{
			return null;
		}

		protected void _ParseBoneTimeline(Dictionary<string, object> rawData)
		{
		}

		protected void _ParseSlotTimeline(Dictionary<string, object> rawData)
		{
		}

		protected int _ParseFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseTweenFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		private int _ParseZOrderFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseBoneAllFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseBoneTranslateFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseBoneRotateFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseBoneScaleFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseSlotDisplayFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseSlotColorFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseSlotFFDFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected int _ParseIKConstraintFrame(Dictionary<string, object> rawData, int frameStart, int frameCount)
		{
			return 0;
		}

		protected List<ActionData> _ParseActionData(object rawData, ActionType type, BoneData bone = null, SlotData slot = null)
		{
			return null;
		}

		protected void _ParseTransform(Dictionary<string, object> rawData, Transform transform, float scale)
		{
		}

		protected void _ParseColorTransform(Dictionary<string, object> rawData, ColorTransform color)
		{
		}

		protected virtual void _ParseArray(Dictionary<string, object> rawData)
		{
		}

		protected void _ModifyArray()
		{
		}

		public override DragonBonesData ParseDragonBonesData(object rawObj, float scale = 1f)
		{
			return null;
		}

		public override bool ParseTextureAtlasData(object rawObj, TextureAtlasData textureAtlasData, float scale = 1f)
		{
			return false;
		}
	}
}
