//
//  Completion.swift
//  
//
//  Created by Ronald Mannak on 3/25/24.
//

import Foundation

/// Completion sent from MLXServer to client
/// # See also
/// [OpenAI API Reference](https://platform.openai.com/docs/guides/text-generation/chat-completions-response-format)
public struct Completion: Codable {
    
    /// A list of chat completion choices. Can be more than one if n is greater than 1.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-choices)
    public struct Choice: Codable {
        
        /// Log probability information for the choice.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-choices)
        struct LogProbs: Codable {}
                
        /// The reason the model stopped generating tokens. This will be stop if the model hit a natural stop point or a provided stop sequence, length if the maximum number of tokens specified in the request was reached, content_filter if content was omitted due to a flag from our content filters, tool_calls if the model called a tool, or function_call (deprecated) if the model called a function.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object)
        let finishReason: FinishReason?
        
        /// The index of the choice in the list of choices.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object)
        let index: Int
        
        /// A chat completion message generated by the model.
        /// # See also
        /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object)
        let message: Message
        
        // TODO: Add support for log probs
        // See: https://cookbook.openai.com/examples/using_logprobs
        let logProbs: LogProbs?
    }
    
    /// Usage statistics for the completion request.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-usage)
    public struct Usage: Codable {
        let completionTokens: Int
        let promptTokens: Int
        let totalTokens: Int
    }
    
    /// A list of chat completion choices. Can be more than one if n is greater than 1.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-choices)
    public let choices: [Choice]
    
    /// The Unix timestamp (in seconds) of when the chat completion was created.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object)
    public let created: Int
    
    /// A unique identifier for the chat completion.
    /// E.g. `chatcmpl-7QyqpwdfhqwajicIEznoc6Q47XAyW`
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-id)
    public let id: String
    
    /// The model used for the chat completion.
    /// E.g. `mlx-community/Nous-Hermes-2-Mistral-7B-DPO-4bit-MLX`
    ///     /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-model)
    public let model: String
    
    /// The object type, which is always `chat.completion`
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-object)
    public var object: String = "chat.completion"
    
    /// Usage statistics for the completion request.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-usage)
    public let usage: Usage
    
    /// This fingerprint represents the backend configuration that the model runs with.
    /// Can be used in conjunction with the `seed` request parameter to understand when backend changes have been made that might impact determinism.
    /// # See also
    /// [OpenAI API Reference](https://platform.openai.com/docs/api-reference/chat/object#chat/object-system_fingerprint)
    /// # Remarks:
    /// - According to the OpenAI documentation, `systemFingerprint` cannot be `NULL`. However, in the examples `systemFingerprint` can be `NULL` 
    public let systemFingerprint: String?
}
