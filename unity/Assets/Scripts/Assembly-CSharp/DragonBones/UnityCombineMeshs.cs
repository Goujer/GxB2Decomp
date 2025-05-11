using System.Collections.Generic;
using UnityEngine;

namespace DragonBones
{
	[DisallowMultipleComponent]
	[ExecuteInEditMode]
	public class UnityCombineMeshs : MonoBehaviour
	{
		[HideInInspector]
		public List<string> slotNames;

		[HideInInspector]
		public MeshBuffer[] meshBuffers;

		[HideInInspector]
		public bool dirty;

		private UnityArmatureComponent _unityArmature;

		private int _subSlotCount;

		private int _verticeOffset;

		private bool _isCanCombineMesh;

		private void Start()
		{
		}

		private void OnDestroy()
		{
		}

		private void RestoreArmature(Armature armature)
		{
		}

		private void LateUpdate()
		{
		}

		public void BeginCombineMesh()
		{
		}

		public void CollectMesh(Armature armature, List<CombineMeshInfo> combineSlots)
		{
		}
	}
}
