using System;
using System.Collections.Generic;
using System.Net.Sockets;
using System.Runtime.InteropServices;
using System.Threading;
using LuaInterface;
using UnityEngine;

public class SocketConnection : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SocketConnected(SocketConnection sc);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void ConnectTimedout(SocketConnection sc);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SendTimedout(SocketConnection sc);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SocketDisconnected(SocketConnection sc);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SocketError(SocketConnection sc, string errorText);

	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SocketMessage(SocketConnection sc, ushort messageID, LuaByteBuffer message);

	private TcpClient _client;

	private NetworkStream _stream;

	private readonly AutoResetEvent _sendEvent;

	private readonly AutoResetEvent _msgEvent;

	private Thread _sendThread;

	private Thread _processThread;

	private Thread _connectThread;

	private readonly Queue<NSEvent> _msgQueue;

	private readonly Queue<NSSendData> _sendQueue;

	private readonly Queue<NSEvent> _queue;

	private uint _sendSequencef;

	private byte[] _sendBuffer;

	private byte[] _sizeBuffer;

	private byte[] _typeBuffer;

	private bool _pauseSending;

	private NSMessageState _messageState;

	private int _readBuffOffset;

	private NSMessage _readMessage;

	private int _sendTimeOut;

	private bool _isInitialize;

	public SocketConnected OnSocketConnected;

	public SendTimedout OnSendTimedout;

	public ConnectTimedout OnConnectTimedout;

	public SocketDisconnected OnSocketDisconnected;

	public SocketError OnSocketError;

	public SocketMessage OnSocketMessage;

	public string Host { get; private set; }

	public ushort Port { get; private set; }

	public int SendTimeout
	{
		get
		{
			return 0;
		}
		set
		{
		}
	}

	public int ConnectionTimeout { get; set; }

	public bool IsSocketConnected
	{
		get
		{
			return false;
		}
	}

	public bool IsDisposed { get; private set; }

	public static SocketConnection Create()
	{
		return null;
	}

	private void Init()
	{
	}

	public uint NextSequence()
	{
		return 0u;
	}

	public void Connect(string host, ushort port)
	{
	}

	private void ConnectThread()
	{
	}

	private void ConnectCallback(IAsyncResult ar)
	{
	}

	private void HandleDataReceived(IAsyncResult ar)
	{
	}

	private void ReadNextState()
	{
	}

	private void Update()
	{
	}

	private void ProcessEvent(NSEvent evt)
	{
	}

	public void Send(ushort type, byte[] data)
	{
	}

	public void CancelCurrentSend()
	{
	}

	public void ResumeSend()
	{
	}

	private void SendThread()
	{
	}

	private void ProcessThread()
	{
	}

	private void OnError(SocketException e)
	{
	}

	private void OnError(string message)
	{
	}

	private void Send(NSSendData sendData)
	{
	}

	private void DispatchEvent(NSEvent e)
	{
	}

	public void Disconnect()
	{
	}

	private void OnClosed()
	{
	}

	public void Dispose()
	{
	}
}
