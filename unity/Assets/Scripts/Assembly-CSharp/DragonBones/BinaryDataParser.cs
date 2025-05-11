using System.Collections.Generic;
using System.Runtime.InteropServices;

namespace DragonBones
{
	public class BinaryDataParser : ObjectDataParser
	{
		[StructLayout(LayoutKind.Auto, Size = 8)]
		public delegate object JsonParseDelegate(string json);

		public static JsonParseDelegate jsonParseDelegate;

		private int _binaryOffset;

		private byte[] _binary;

		private short[] _intArrayBuffer;

		private float[] _floatArrayBuffer;

		private short[] _frameIntArrayBuffer;

		private float[] _frameFloatArrayBuffer;

		private short[] _frameArrayBuffer;

		private ushort[] _timelineArrayBuffer;

		private TimelineData _ParseBinaryTimeline(TimelineType type, uint offset, TimelineData timelineData = null)
		{
			return null;
		}

		private void _ParseVertices(Dictionary<string, object> rawData, VerticesData vertices)
		{
		}

		protected override void _ParseMesh(Dictionary<string, object> rawData, MeshDisplayData mesh)
		{
		}

		protected override AnimationData _ParseAnimation(Dictionary<string, object> rawData)
		{
			return null;
		}

		protected override void _ParseArray(Dictionary<string, object> rawData)
		{
		}

		public override DragonBonesData ParseDragonBonesData(object rawObj, float scale = 1f)
		{
			return null;
		}

		public static Dictionary<string, object> DeserializeBinaryJsonData(byte[] bytes, out int headerLength, JsonParseDelegate jsonParse = null)
		{
			headerLength = default(int);
			return null;
		}
	}
}
