using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

namespace Spine.Unity
{
	[Serializable]
	public class MeshGenerator
	{
		[Serializable]
		[StructLayout(LayoutKind.Sequential, Size = 28)]
		public struct Settings
		{
			public bool useClipping;

			[Space]
			public float zSpacing;

			[Space]
			public bool pmaVertexColors;

			public bool tintBlack;

			public bool calculateTangents;

			public bool addNormals;

			public bool immutableTriangles;

			public static Settings Default
			{
				get
				{
					return default(Settings);
				}
			}
		}

		public Settings settings;

		private const float BoundsMinDefault = float.PositiveInfinity;

		private const float BoundsMaxDefault = float.NegativeInfinity;

		[NonSerialized]
		private readonly ExposedList<Vector3> vertexBuffer;

		[NonSerialized]
		private readonly ExposedList<Vector2> uvBuffer;

		[NonSerialized]
		private readonly ExposedList<Vector2> uvBuffer4;

		[NonSerialized]
		private readonly ExposedList<Vector2> uvBuffer6;

		[NonSerialized]
		private readonly ExposedList<Color32> colorBuffer;

		[NonSerialized]
		private readonly ExposedList<ExposedList<int>> submeshes;

		[NonSerialized]
		private Vector2 meshBoundsMin;

		[NonSerialized]
		private Vector2 meshBoundsMax;

		[NonSerialized]
		private float meshBoundsThickness;

		[NonSerialized]
		private int submeshIndex;

		[NonSerialized]
		private SkeletonClipping clipper;

		[NonSerialized]
		private float[] tempVerts;

		[NonSerialized]
		private int[] regionTriangles;

		[NonSerialized]
		private Vector3[] normals;

		[NonSerialized]
		private Vector4[] tangents;

		[NonSerialized]
		private Vector2[] tempTanBuffer;

		[NonSerialized]
		private ExposedList<Vector2> uv2;

		[NonSerialized]
		private ExposedList<Vector2> uv3;

		private static List<Vector3> AttachmentVerts;

		private static List<Vector2> AttachmentUVs;

		private static List<Color32> AttachmentColors32;

		private static List<int> AttachmentIndices;

		public int VertexCount
		{
			get
			{
				return 0;
			}
		}

		public MeshGeneratorBuffers Buffers
		{
			get
			{
				return default(MeshGeneratorBuffers);
			}
		}

		public static void GenerateSingleSubmeshInstruction(SkeletonRendererInstruction instructionOutput, Skeleton skeleton, Material material)
		{
		}

		public static void GenerateSkeletonRendererInstruction(SkeletonRendererInstruction instructionOutput, Skeleton skeleton, Dictionary<Slot, Material> customSlotMaterials, List<Slot> separatorSlots, bool generateMeshOverride, bool immutableTriangles = false)
		{
		}

		public static void TryReplaceMaterials(ExposedList<SubmeshInstruction> workingSubmeshInstructions, Dictionary<Material, Material> customMaterialOverride)
		{
		}

		public void Begin()
		{
		}

		public void AddSubmesh(SubmeshInstruction instruction, bool updateTriangles = true)
		{
		}

		public void BuildMesh(SkeletonRendererInstruction instruction, bool updateTriangles)
		{
		}

		public void BuildMeshWithArrays(SkeletonRendererInstruction instruction, bool updateTriangles)
		{
		}

		public void ScaleVertexData(float scale)
		{
		}

		private void AddAttachmentTintBlack(float r2, float g2, float b2, int vertexCount)
		{
		}

		public void FillVertexData(Mesh mesh)
		{
		}

		public void FillLateVertexData(Mesh mesh)
		{
		}

		public void FillTriangles(Mesh mesh)
		{
		}

		public void FillTrianglesSingle(Mesh mesh)
		{
		}

		public void EnsureVertexCapacity(int minimumVertexCount, bool inlcudeTintBlack = false, bool includeTangents = false, bool includeNormals = false)
		{
		}

		public void TrimExcess()
		{
		}

		internal static void SolveTangents2DEnsureSize(ref Vector4[] tangentBuffer, ref Vector2[] tempTanBuffer, int vertexCount)
		{
		}

		internal static void SolveTangents2DTriangles(Vector2[] tempTanBuffer, int[] triangles, int triangleCount, Vector3[] vertices, Vector2[] uvs, int vertexCount)
		{
		}

		internal static void SolveTangents2DBuffer(Vector4[] tangents, Vector2[] tempTanBuffer, int vertexCount)
		{
		}

		public static void FillMeshLocal(Mesh mesh, RegionAttachment regionAttachment)
		{
		}

		public static void FillMeshLocal(Mesh mesh, MeshAttachment meshAttachment, SkeletonData skeletonData)
		{
		}
	}
}
