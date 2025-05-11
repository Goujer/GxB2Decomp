using System;
using System.Collections.Generic;
using UnityEngine;

namespace DragonBones
{
	public class MeshBuffer : IDisposable
	{
		public readonly List<UnitySlot> combineSlots;

		public string name;

		public Mesh sharedMesh;

		public int vertexCount;

		public Vector3[] rawVertextBuffers;

		public Vector2[] uvBuffers;

		public Vector3[] vertexBuffers;

		public Color32[] color32Buffers;

		public int[] triangleBuffers;

		public bool vertexDirty;

		public bool zorderDirty;

		public bool enabled;

		public static Mesh GenerateMesh()
		{
			return null;
		}

		private static int _OnSortSlots(Slot a, Slot b)
		{
			return 0;
		}

		public void Dispose()
		{
		}

		public void Clear()
		{
		}

		public void CombineMeshes(CombineInstance[] combines)
		{
		}

		public void InitMesh()
		{
		}

		public void UpdateVertices()
		{
		}

		public void UpdateColors()
		{
		}

		public void UpdateOrder()
		{
		}
	}
}
